import SwiftUI

// MARK: - RootView

struct RootView: View {

  @State var isSheetDisplayed: Bool = false

  var body: some View {
    content
      .sheet(isPresented: $isSheetDisplayed) {} content: {
        SheetView(
          viewModel: SheetViewModel(),
          isPresented: $isSheetDisplayed
        )
      }

  }

  private var content: some View {
    Button("Open Sheet") {
      isSheetDisplayed = true
    }
  }
}

// MARK: - RootView_Previews

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
