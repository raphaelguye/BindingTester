import Foundation
import SwiftUI

class SheetViewModel: ObservableObject {

  @Binding var isPresented: Bool

  init(isPresented: Binding<Bool> = .constant(false)) {
    _isPresented = isPresented
  }

  func onClose() {
    isPresented = false
  }

}
