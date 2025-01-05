import SwiftUI
import PageControl
import HybridColor
//import HapticFeedback
/**
 * Content
 * - Fixme: ⚠️️ See legacy regarding how it used haptic feedback for onboarding etc
 */
extension NavView {
   /**
    * Body
    * - Description: This is the main body of the NavView. It consists of a
    *                vertical stack (VStack) that contains the page control,
    *                action button, and dismiss button. The page control shows
    *                the current page in the onboarding process, the action
    *                button allows the user to proceed to the next page, and the
    *                dismiss button allows the user to skip the onboarding
    *                process.
    * - Fixme: ⚠️️ Add spacing in vstack?
    */
   var body: some View {
      stack
   }
}
