import XCTest
import SwiftUI

class SheetViewModelTest: XCTestCase {

  func testBindingWithConstant() {

    let viewModel = SheetViewModel(isPresented: .constant(true))

    XCTAssertTrue(viewModel.isPresented)
    viewModel.onClose()
    XCTAssertFalse(viewModel.isPresented)
  }

  func testBindingWithState() {

    @State var isSheetDisplayed: Bool = true
    let viewModel = SheetViewModel(isPresented: $isSheetDisplayed)

    XCTAssertTrue(viewModel.isPresented)
    viewModel.onClose()
    XCTAssertFalse(viewModel.isPresented)
  }

  func testBindingWithBindingObject() {

    let isSheetDisplayed: Binding<Bool> = .constant(true)
    let viewModel = SheetViewModel(isPresented: isSheetDisplayed)

    XCTAssertTrue(viewModel.isPresented)
    viewModel.onClose()
    XCTAssertFalse(viewModel.isPresented)
  }

}
