import SwiftUI
/**
 * Onboarding Controller (Next / Prev buttons)
 * - Description: Has left and right buttons for navigating back and forth
 * - Note: The `onPrevButtonPress` and `onNextButtonPress` closures are used as the actions for the buttons. The foregroundColor, background, and cornerRadius modifiers are used to style the buttons.
 * - Fixme: ⚠️️ Store margin, spacing etc in const
 */
struct ControlOverlay: View {
   /**
    * The current page number
    * - Description: This property represents the current page number in the onboarding flow. 
    *                It is used to track the user's progress and control the navigation between different pages.
    */
   @Binding var currentPage: Int // Bind the current page number to the view
   /**
    * The total number of pages
    * - Description: This property represents the total number of pages in the onboarding flow. It is used to control the navigation and determine when the navigation buttons should be enabled or disabled.
    */
   let numOfPages: Int // Total number of pages in the onboarding flow
   /**
    * Closure for handling the action when the previous button is pressed
    * - Description: This closure is triggered when the previous button is pressed. It allows for custom behavior to be defined for navigating backwards in the onboarding flow.
    */
   var onPrevButtonPress: OnPrevButtonPress? = defaultPrevButtonPress // Default action for previous button press
   /**
    * Closure for handling the action when the next button is pressed
    * - Description: This closure is triggered when the next button is pressed. It allows for custom behavior to be defined for navigating forwards in the onboarding flow.
    */
   var onNextButtonPress: OnNextButtonPress? = defaultOnNextButtonPress // Default action for next button press
}
