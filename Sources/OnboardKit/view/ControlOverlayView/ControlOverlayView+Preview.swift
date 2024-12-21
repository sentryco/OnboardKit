#if os(macOS)
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
   struct DebugContainer: View {
      @State var currentPage: Int = 1
      let numOfPages = 4
      var body: some View {
         ControlOverlayView(currentPage: $currentPage, numOfPages: numOfPages, onPrevButtonPress: {
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
   let view = {
      DebugContainer()
         .padding(.horizontal)
   }()
   return ZStack {
      Rectangle() // A rectangle to fill the background
         .fill(Color.secondaryBackground) // Fills the rectangle with a secondary background color
         .ignoresSafeArea(.all) // Ignores the safe area on all sides
      VStack(spacing: .zero) { // A vertical stack with no spacing
         view // The content view
            .environment(\.colorScheme, .light) // Sets the environment to light mode
         view // The content view again
            .environment(\.colorScheme, .dark) // Sets the environment to dark mode
      }
   }
   .environment(\.colorScheme, .dark)
}
#endif
