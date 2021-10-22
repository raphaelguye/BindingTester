# BindingTester
Trying to implement Unit Tests for ```@Binding``` properties in a ViewModel

### ViewModel to be tested

```
class SheetViewModel: ObservableObject {

  @Binding var isPresented: Bool
  
  func onClose() {
    isPresented = false // To be unit tested
  }
  
  init(isPresented: Binding<Bool>) {
    _isPresented = isPresented
```
  
### Unit tests try out - not working

```
func test1() {
  let viewModel = SheetViewModel(isPresented: .constant(true))

  XCTAssertTrue(viewModel.isPresented)
  viewModel.onClose()
  XCTAssertFalse(viewModel.isPresented)
}
```

```
func test2() {
  @State var isSheetDisplayed: Bool = true
  let viewModel = SheetViewModel(isPresented: $isSheetDisplayed) // Accessing State's value outside of being installed on a View.

  XCTAssertTrue(viewModel.isPresented)
  viewModel.onClose()
  XCTAssertFalse(viewModel.isPresented)
}
```

```
func test3() {
  let isSheetDisplayed: Binding<Bool> = .constant(true)
  let viewModel = SheetViewModel(isPresented: isSheetDisplayed)

  XCTAssertTrue(viewModel.isPresented)
  viewModel.onClose()
  XCTAssertFalse(viewModel.isPresented)
}
```
