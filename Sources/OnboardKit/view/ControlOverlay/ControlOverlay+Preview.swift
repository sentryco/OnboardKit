#if canImport(SwiftUI) && compiler(>=6.0) // ⚠️️ fix for ga bug
import SwiftUI
import HybridColor
/**
 * Preview (dark / light)
 * - Description: This section of the code previews the ControlOverlay view
 *                in both dark and light modes. It helps in visualizing the
 *                appearance and functionality of the navigation controls during
 *                the onboarding process.
 */
#Preview(traits: .fixedLayout(width: 300, height: 300)) {
   @Previewable @State var currentPage: Int = 1
   let numOfPages: Int = 4
   return PreviewContainer {
      ControlOverlay(currentPage: $currentPage, numOfPages: numOfPages, onPrevButtonPress: {
         Swift.print("Prev button pressed")
         currentPage -= 1
      }, onNextButtonPress: {
         Swift.print("Next button pressed")
         currentPage += 1
      })
      .padding()
      .background(Color.blackOrWhite)
      .onChange(of: currentPage) { _, _ in
         Swift.print("currentPage:  \(currentPage)")
      }
   }
}
#endif
