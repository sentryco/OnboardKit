import SwiftUI
/**
 * Const
 * - Fixme: ⚠️️ figure out how to inject consts somehow in the init process etc. ask copilot etc
 */
extension NavView {
   /**
    * The title for the skip button.
    * - Description: This constant defines the text displayed on the skip button within the navigation view.
    */
   static let skipButtonTitle: String = "Skip"
   /**
    * The title for the continue button.
    * - Description: This constant defines the text displayed on the continue button within the navigation view.
    */
   static let continueButtonTitle: String = "Continue"
   /**
    * The title for the finish button.
    * - Description: This constant defines the text displayed on the finish button within the navigation view.
    */
   static let finishButtonTitle: String = "Finish"

   /**
    * A closure that is called when the action button is pressed.
    * - Description: This closure is triggered when the action button is
    *                pressed. It allows for custom behavior to be defined for
    *                the action button in the onboarding process.
    */
   typealias OnActionBtnPress = () -> Void
   /**
    * A closure that is called when the dismiss button is pressed.
    * - Description: This closure is triggered when the dismiss button is
    *                pressed. It allows for custom behavior to be defined for
    *                dismissing the onboarding process.
    */
   typealias OnDismissBtnPress = () -> Void
   /**
    * The vertical spacing between elements in the navigation view.
    * - Description: This constant defines the vertical spacing used to separate 
    *                various UI elements within the navigation view, ensuring 
    *                consistent layout and spacing throughout the onboarding process.
    */
   static let verticalSpacing: CGFloat = 12
   /**
    * The horizontal padding applied to the content of the navigation view.
    * - Description: This constant defines the horizontal padding that is applied 
    *                to the content within the navigation view. It ensures that 
    *                the content is adequately spaced from the edges, providing a 
    *                balanced and visually appealing layout.
    */
   static let horizontalPadding: CGFloat = 24 // 12
   /**
    * The bottom padding of the navigation view.
    * - Description: This constant defines the padding applied at the bottom of the 
    *                navigation view. It ensures that the content does not touch 
    *                the bottom edge, providing adequate spacing for aesthetic 
    *                balance and usability.
    */
   static let bottomPadding: CGFloat = 12
}
