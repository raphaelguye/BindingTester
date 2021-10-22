import XCTest
import SwiftUI

class SheetViewModelTest: XCTestCase {

  func testWithBindingSetter() {

    var isPresentedBindingValue = true
    let isPresentedBinding = Binding(get: { isPresentedBindingValue }, set: { isPresentedBindingValue = $0 })
    let viewModel = SheetViewModel(isPresented: isPresentedBinding)

    XCTAssertTrue(isPresentedBindingValue)
    viewModel.onClose()
    XCTAssertFalse(isPresentedBindingValue)
  }

  // Not Working use cases:
//  func testBindingWithConstant() {
//
//    let viewModel = SheetViewModel(isPresented: .constant(true))
//
//    XCTAssertTrue(viewModel.isPresented)
//    viewModel.onClose()
//    XCTAssertFalse(viewModel.isPresented)
//  }
//
//  func testBindingWithState() {
//
//    @State var isSheetDisplayed: Bool = true
//    let viewModel = SheetViewModel(isPresented: $isSheetDisplayed)
//
//    XCTAssertTrue(viewModel.isPresented)
//    viewModel.onClose()
//    XCTAssertFalse(viewModel.isPresented)
//  }
//
//  func testBindingWithBindingObject() {
//
//    let isSheetDisplayed: Binding<Bool> = .constant(true)
//    let viewModel = SheetViewModel(isPresented: isSheetDisplayed)
//
//    XCTAssertTrue(viewModel.isPresented)
//    viewModel.onClose()
//    XCTAssertFalse(viewModel.isPresented)
//  }

}
