# BindingTester

Implementing Unit Test for ```@Binding``` properties in a ViewModel.<br/>
The initial problem was that we can't use ```@Binding``` or ```@State``` outside of SwiftUI.
We had to find a way to test it.

### ViewModel to be tested

```
class SheetViewModel: ObservableObject {

  @Binding var isPresented: Bool
  
  func onClose() {
    isPresented = false // To be tested
  }
  
  init(isPresented: Binding<Bool>) {
    _isPresented = isPresented
```

### ✅ Working solution for unit test

```
func testWithBindingSetter() {
  var bindingValue = true
  let binding = Binding(get: { bindingValue }, set: { bindingValue = $0 })
  
  let viewModel = SheetViewModel(isPresented: binding)

  XCTAssertTrue(bindingValue)
  viewModel.onClose()
  XCTAssertFalse(bindingValue)
}
```
  
### ❌ First try out - not working

```
func test1() {
  let viewModel = SheetViewModel(isPresented: .constant(true))

  XCTAssertTrue(viewModel.isPresented)
  viewModel.onClose()
  XCTAssertFalse(viewModel.isPresented) // remains true
}
```

```
func test2() {
  @State var isSheetDisplayed: Bool = true
  let viewModel = SheetViewModel(isPresented: $isSheetDisplayed) // Accessing State's value outside of being installed on a View.

  XCTAssertTrue(viewModel.isPresented)
  viewModel.onClose()
  XCTAssertFalse(viewModel.isPresented) // remains true
}
```

```
func test3() {
  let isSheetDisplayed: Binding<Bool> = .constant(true)
  let viewModel = SheetViewModel(isPresented: isSheetDisplayed)

  XCTAssertTrue(viewModel.isPresented)
  viewModel.onClose()
  XCTAssertFalse(viewModel.isPresented) // remains true
}
```
