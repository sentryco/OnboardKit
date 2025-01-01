#if os(macOS)
import Foundation
/**
 * Const
 */
extension ControlOverlay {
   /**
    * Typealias for the closure when the previous button is pressed
    * - Description: Defines a closure type for handling actions when the
    *                previous button is pressed in the onboarding process.
    */
   internal typealias OnPrevButtonPress = () -> Void // Closure type for previous button press
   /**
    * Typealias for the closure when the next button is pressed
    * - Description: Defines a closure type for handling actions when the next
    *                button is pressed in the onboarding process.
    */
   internal typealias OnNextButtonPress = () -> Void // Closure type for next button press
   /**
    * Default action for previous button press
    * - Abstract: Default action for previous button press
    * - Description: Defines a default action for when the previous button is
    *                pressed in the onboarding process. This action simply logs
    *                "Default prev" to the console, serving as a placeholder for
    *                more complex behavior.
    */
   internal static let defaultPrevButtonPress: OnPrevButtonPress = {
      Swift.print("Default prev")
   }
   /**
    * Default action for next button press
    * - Abstract: Default action for next button press
    * - Description: This is the default action that is triggered when the next
    *                button is pressed during the onboarding process. Currently,
    *                it prints "Default next" to the console.
    */
   internal static let defaultOnNextButtonPress: OnNextButtonPress = {
      Swift.print("Default next")
   }
}
#endif
