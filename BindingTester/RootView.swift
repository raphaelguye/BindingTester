import SwiftUI

// MARK: - RootView

struct RootView: View {

  @State var isSheetPresented: Bool = false

  var body: some View {
    content
      .sheet(isPresented: $isSheetPresented) {} content: {
        SheetView(
          viewModel: SheetViewModel(isPresented: $isSheetPresented)
        )
      }

  }

  private var content: some View {
    Button("Open Sheet") {
      isSheetPresented = true
    }
  }
}

// MARK: - RootView_Previews

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
