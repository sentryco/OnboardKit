import SwiftUI
import HybridColor
/**
 * Preview the navview (Dark / light mode)
 * - Description: This section previews the NavView in both dark and light
 *                modes. It helps in visualizing the appearance and
 *                functionality of the navigation controls during the
 *                onboarding process.
 * - Fixme: ⚠️️ Add some extra background with gray
 * - Fixme: ⚠️️ Add fixed layout again?
 */
#Preview { // ⚠️️ We don't need fixed layout for this (traits: .fixedLayout(width: 300, height: 300))
   struct DebugView: View {
      @State var currentPage = 0
      var body: some View {
         NavView( // This line initializes the NavView with the specified number of pages and current page bindings.
            numOfPages: 3,
            currentPage: $currentPage,
            onActionBtnPress: { Swift.print("action") },
            onDismissBtnPress: { Swift.print("dismiss") } 
         )
      }
   }
   let view = {
      DebugView()
         .padding(.vertical, 20)
         .background(Color.blackOrWhite)
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
   #if os(macOS)
   .padding(.horizontal)
   #endif
   .environment(\.colorScheme, .dark)
}
