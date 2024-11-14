import SwiftUI
/**
 * Const
 * - Fixme: ⚠️️ figure out how to inject consts somehow in the init process etc. ask copilot etc
 */
extension NavView {
   /**
    * - Fixme: ⚠️️ add doc
    */
   static let skipButtonTitle: String = "Skip"
   /**
    * - Fixme: ⚠️️ add doc
    */
   static let continueButtonTitle: String = "Continue"
   /**
    * - Fixme: ⚠️️ add doc
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
}
