import SwiftUI
import HybridColor
/**
 * - Abstract: The control overlay is a simple view that contains two buttons
 *             (prev and next) that are used to navigate through the pages.
 * - Description: The ControlOverlay extension provides the user interface for
 *                the navigation controls in the onboarding flow. It includes a
 *                previous and next button for navigating through the onboarding
 *                pages.
 * - Fixme: ⚠️️⚠️️ Use the `HeaderIconButtonStyle` instead, it looks better, still valid?
 * - Fixme: ⚠️️ Add comments from legacy etc?
 */
extension ControlOverlay {
   /**
    * Body
    * - Description: This is the main body of the ControlOverlay view. It contains a horizontal stack (HStack) with two conditional buttons for navigation - previous and next. The previous button appears if the current page is not the first one, and the next button appears if the current page is not the last one. The buttons are pushed to the left and right edges of the HStack by a Spacer view. The entire HStack has horizontal padding for better visual appearance.
    */
   var body: some View {
      HStack { // HStack (horizontal stack) with two Button views
         if currentPage != .zero { // not first page
            prevBtn // This line adds the previous button to the view
         }
         Spacer() // The Spacer view is used to push the buttons to the left and right edges of the HStack.
         if currentPage != (numOfPages - 1) { // not last page
            nextBtn // This line creates the 'Next' button for navigating to the next page in the onboarding process.
         }
      }
      // - Fixme: ⚠️️ add const for the bellow?
      .padding(.horizontal) // The padding modifier is used to add horizontal padding to the HStack.
   }
}
