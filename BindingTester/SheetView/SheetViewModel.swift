import Foundation

class SheetViewModel: ObservableObject {

  @Published var isPresented: Bool = true

  func onClose() {
    isPresented = false
  }

}
