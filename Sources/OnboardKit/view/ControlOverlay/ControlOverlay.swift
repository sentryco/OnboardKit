#if os(macOS)
import SwiftUI
/**
 * Onboarding Controller (macOS only)
 * - Abstract: Next / Prev buttons
 * - Description: Has left and right buttons for navigating back and forth.
 *                Back button is hidden at first index, and Next button is hidden at last index.
 * - Note: The `onPrevButtonPress` and `onNextButtonPress` closures are used as the actions for the buttons.
 *         The foregroundColor, background, and cornerRadius modifiers are used to style the buttons.
 * - Fixme: ⚠️️ Store margin, spacing etc in const, elaborate?
 */
struct ControlOverlay: View {
   /**
    * The current page number
    * - Abstract: Bind the current page number to the view
    * - Description: This property represents the current page number in the
    *                onboarding flow. It is used to track the user's progress and
    *                control the navigation between different pages.
    */
   @Binding internal var currentPage: Int
   /**
    * The total number of pages
    * - Abstract: Total number of pages in the onboarding flow
    * - Description: This property represents the total number of pages in
    *                the onboarding flow. It is used to control the navigation
    *                and determine when the navigation buttons should be enabled
    *                or disabled.
    */
   internal let numOfPages: Int
   /**
    * Closure for handling the action when the previous button is pressed
    * - Description: This closure is triggered when the previous button
    *                is pressed. It allows for custom behavior to be
    *                defined for navigating backwards in the onboarding
    *                flow.
    */
   internal var onPrevButtonPress: OnPrevButtonPress? = defaultPrevButtonPress
   /**
    * Closure for handling the action when the next button is pressed
    * - Description: This closure is triggered when the next button is pressed.
    *                It allows for custom behavior to be defined for navigating
    *                forwards in the onboarding flow.
    */
   internal var onNextButtonPress: OnNextButtonPress? = defaultOnNextButtonPress
}
// ⚠️️ Deprecated
@available(*, deprecated, renamed: "ControlOverlay")
internal typealias ControlOverlayView = ControlOverlay
#endif
