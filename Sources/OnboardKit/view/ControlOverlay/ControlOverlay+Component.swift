import SwiftUI
import HybridColor
/**
 * Components
 */
extension ControlOverlay {
   /**
    * Prev btn
    * - Abstract: The previous button is used to navigate to the previous page.
    * - Description: The previous button allows the user to navigate back to the
    *                previous page in the onboarding process. It triggers the
    *                'onPrevButtonPress' closure when pressed.
    * - Note: The button has to be setup like it is now.
    * - Note: We can also use: `.chevronButtonStyle(systemName: "chevron.left")`
    * - Fixme: ⚠️️ Maybe a make a button convenience init that just takes action?
    * - Fixme: ⚠️️ Use the arrow icons instead? or fine as is?
    * - Fixme: ⚠️️ Use relative sizing for icon?
    * - Fixme: ⚠️️ Make this const in ConstLib etc
    * - Fixme: ⚠️️ Rename to `previousButton`?
    * - Fixme: ⚠️️ Move the style into this scope?
    * - Fixme: ⚠️️ Icon name Move to a const
    * - Fixme: ⚠️️ use Metric.accessoryIconSize? 👈
    */
   internal var prevBtn: some View {
      Button(action: { self.onPrevButtonPress?() }) {}
         .headerIconStyle(
            iconName: "chevron.left", // Set the icon name to "chevron.left"
            iconSize: 16, // Set the icon size to 16
            padding: 16, // Set the padding to Measure.margin
            iconColor: style.iconColor, // Set the icon color to white or black
            backgroundColor: style.bgColor, // Set the background color to gray with 0.2 opacity
            strokeColor: style.borderColor, // Set the stroke color to white or black with 0.5 opacity
            strokeWidth: 1 // Set the stroke width to 1
         )
      // - Fixme: ⚠️️ Add isTest as internal var etc
      // .background(isTest ? .green : .clear) // ⚠️️ debug
   }
   /**
    * Next btn
    * - Abstract: The next button is used to navigate to the next page.
    * - Description: The next button allows the user to navigate forward to the
    *                next page in the onboarding process. It triggers the
    *                'onNextButtonPress' closure when pressed.
    * - Note: The button has to be setup like it is now.
    * - Note: We can also use: .chevronButtonStyle(systemName: "chevron.right")
    * - Fixme: ⚠️️ Maybe a make a button convenience init that just takes action?
    * - Fixme: ⚠️️ Rename to nextButton
    * - Fixme: ⚠️️ Move iconName to a const
    */
   internal var nextBtn: some View {
      Button(action: { self.onNextButtonPress?() }) {}
         .headerIconStyle(
            iconName: "chevron.right", // Set the icon name to "chevron.right"
            iconSize: 16, // Set the icon size to 16
            padding: 16, // Set the padding to Measure.margin
            iconColor: style.iconColor, // Set the icon color to white or black
            backgroundColor: style.bgColor, // Set the background color to gray with 0.2 opacity
            strokeColor: style.borderColor, // Set the stroke color to white or black with 0.5 opacity
            strokeWidth: 1 // Set the stroke width to 1
         )
      // .background(isTest ? .orange : .clear) // ⚠️️ debug
   }
}
/**
 * Style
 */
extension ControlOverlay {
   /**
    * Style
    * - Fixme: ⚠️️ Rename to buttonStyle? 👈
    * - Fixme: ⚠️️ Move type to typealias? 👈 name it ControlOverlayStyle?
    */
   fileprivate var style: (iconColor: Color, bgColor: Color, borderColor: Color) {
      let iconColor = Color.whiteOrBlack // Palette.Button.icon
      let bgColor: Color = .gray.opacity(0.2) // Palette.Background.secondary
      let borderColor = Color.whiteOrBlack.opacity(0.5)
      // let borderColor = Palette.Background.primary
      return (
         iconColor, // The icon color is set to either white or black based on the current theme. // solve fixme, append comment to end of line
         bgColor,
         borderColor
      )
   }
}
