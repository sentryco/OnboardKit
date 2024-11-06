import SwiftUI
/**
 * Const
 * - Fixme: ⚠️️ figure out how to inject consts somehow. ask copilot etc
 */
extension NavView {
   // fix: add doc
   static let skipButtonTitle: String = "Skip" // Const.Onboarding.skipButtonTitle
   // fix: add doc
   static let continueButtonTitle: String = "Continue" // Const.Onboarding.continueButtonTitle
   // fix: add doc
   static let finishButtonTitle: String = "Finish" // Const.Onboarding.finishButtonTitle

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
