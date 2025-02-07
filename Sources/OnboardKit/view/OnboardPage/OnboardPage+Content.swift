import SwiftUI
/**
 * Content
 * - Description: Each page consists of a title, description, button column
 * - Fixme: ⚠️️ Maybe make description have the same padding as action button, still relevant?
 */
extension OnboardPage {
   /**
    * Body
    * - Description: This property represents the main content view of an
    *                onboard page. It constructs the view by stacking the
    *                title, description, and action buttons vertically.
    *                The background color is set to teal for testing
    *                purposes, and a sheet configuration is applied to the
    *                entire stack.
    */
   internal var body: some View {
      configSheet(view: self.stack)
         .background(isOnboardTest ? .teal : .clear) // ⚠️️ debug
   }
}
