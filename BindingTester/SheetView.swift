//
// Created by Raphael Guye on 20.10.21
// https://github.com/raphaelguye
//

import SwiftUI

// MARK: - SheetView

struct SheetView: View {

  @ObservedObject var viewModel: SheetViewModel

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
    SheetView(viewModel: SheetViewModel(isPresented: .constant(true)))
  }
}
