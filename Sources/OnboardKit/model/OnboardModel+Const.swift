import SwiftUI
/**
 * Const
 */
extension OnboardModel {
   /**
    * View is needed to prompt alert and sheet from etc
    * - Description: This typealias defines a type for actions that can be
    *                performed in the onboarding model. It takes an
    *                ObservableSheet as a parameter and does not return any
    *                value.
    * - Note: Consider renaming `OnboardModelAction` to `OnboardInteraction`
    *         to better reflect its purpose of handling user interactions
    *         within the onboarding process.
    * - Fixme: ⚠️️ add abstract
    * - Fixme: ⚠️️ Make observableSheet optional, so that we can trigger other things with actions as well, like payment action
    */
   public typealias OnboardModelAction = (_ observableSheet: ObservableSheet?) -> Void
   /**
    * Action for the onboarding view
    * - Description: This typealias defines a type for actions that can be
    *                performed on the onboarding view. Each action is
    *                represented by a button with a unique title and an
    *                associated function that is executed when the button is
    *                clicked.
    * - Important: ⚠️️ Make sure button-title must be unique as it's used for for-each id
    * - Note: Alternative name: `OnBoardButton`, `OnboardActionItem`
    * - Fixme: ⚠️️ Add id again later etc? or use int etc?
    * - Fixme: ⚠️️ Use a struct? move to own file? maybe yes
    * - Fixme: ⚠️️ Consider renaming to `OnboardButtonAction` for clarity and alignment with domain terminology.
    * - Fixme: ⚠️️ add abstract
    */
   public typealias OnboardAction = (
      buttonTitle: String, // Title of the button
      action: OnboardModelAction? // Callback for the button
   )
   /**
    * Bulk
    * - Description: This typealias defines a collection of actions that can be performed on the onboarding view.
    *                Each action is represented by a button with a unique title and an associated function that is
    *                executed when the button is clicked. This collection allows for multiple actions to be defined
    *                and managed together.
    */
   public typealias OnboardActions = [OnboardAction]
}
