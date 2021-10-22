import SwiftUI
import Combine

// MARK: - SheetView

struct SheetView: View {

  @ObservedObject var viewModel: SheetViewModel
  @Binding var isPresented: Bool
  private var cancellables = Set<AnyCancellable>()

  init(viewModel: SheetViewModel, isPresented: Binding<Bool>) {
    self.viewModel = viewModel
    _isPresented = isPresented

    viewModel.$isPresented
      .sink { isPresentedNewValue in
        DispatchQueue.main.async {
          isPresented.wrappedValue = isPresentedNewValue
        }
      }
      .store(in: &cancellables)
  }

  var body: some View {
    VStack {
      Text("Sheet View")
      Button("Close") {
        viewModel.onClose()
      }
    }
  }
}

// MARK: - SheetView_Previews

struct SheetView_Previews: PreviewProvider {
  static var previews: some View {
    SheetView(viewModel: SheetViewModel(), isPresented: .constant(true))
  }
}
