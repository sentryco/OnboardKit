import SwiftUI
//import InterfaceLib
import HybridColor
/**
 * - Abstract: The control overlay is a simple view that contains two buttons
 *             (prev and next) that are used to navigate through the pages.
 * - Description: The ControlOverlay extension provides the user interface for
 *                the navigation controls in the onboarding flow. It includes a
 *                previous and next button for navigating through the onboarding
 *                pages.
 * - Fixme: ⚠️️⚠️️ Use the `HeaderIconButtonStyle` instead, it looks better, still valid?
 * - Fixme: ⚠️️ add comments from legacy etc?
 */
extension ControlOverlay {
   /**
    * Body
    * - Description: This is the main body of the ControlOverlay view. It contains a horizontal stack (HStack) with two conditional buttons for navigation - previous and next. The previous button appears if the current page is not the first one, and the next button appears if the current page is not the last one. The buttons are pushed to the left and right edges of the HStack by a Spacer view. The entire HStack has horizontal padding for better visual appearance.
    */
   var body: some View {
      HStack { // HStack (horizontal stack) with two Button views
         if currentPage != .zero { // not first page
            prevBtn // This line adds the previous button to the view
         }
         Spacer() // The Spacer view is used to push the buttons to the left and right edges of the HStack.
         if currentPage != (numOfPages - 1) { // not last page
            nextBtn // This line creates the 'Next' button for navigating to the next page in the onboarding process.
         }
      }
      .padding(.horizontal) // The padding modifier is used to add horizontal padding to the HStack.
   }
}
/**
 * Components
 */
extension ControlOverlay {
   /**
    * Style
    * - Fixme: ⚠️️ rename to buttonStyle? 👈
    * - Fixme: ⚠️️ Move type to typealias?
    */
   fileprivate var style: (iconColor: Color, bgColor: Color, borderColor: Color) {
      let iconColor = Color.whiteOrBlack
      // let iconColor = Palette.Button.icon
      // let bgColor = Palette.Background.secondary
      let bgColor: Color = .gray.opacity(0.2)
      let borderColor = Color.whiteOrBlack.opacity(0.5)
      // let borderColor = Palette.Background.primary
      return (
         iconColor, // The icon color is set to either white or black based on the current theme. // solve fixme, append comment to end of line
         bgColor,
         borderColor
      )
   }
   /**
    * Prev btn
    * - Abstract: The previous button is used to navigate to the previous page.
    * - Description: The previous button allows the user to navigate back to the
    *                previous page in the onboarding process. It triggers the
    *                'onPrevButtonPress' closure when pressed.
    * - Note: The button has to be setup like it is now.
    * - Note: We can also use: .chevronButtonStyle(systemName: "chevron.left")
    * - Fixme: ⚠️️ Maybe a make a button convenience init that just takes action?
    * - Fixme: ⚠️️ Use the arrow icons instead? or fine as is?
    * - Fixme: ⚠️️ Use relative sizing for icon?
    * - Fixme: ⚠️️ Make this const in ConstLib etc
    * - Fixme: ⚠️️ Rename to previousButton?
    */
   fileprivate var prevBtn: some View {
      Button(action: { self.onPrevButtonPress?() }) {}
         // .chevronButtonStyle(systemName: "chevron.left")
         // - Fixme: ⚠️️ Move the style into this scope
         .headerIconStyle(
            // - Fixme: ⚠️️ Move to a const
            iconName: "chevron.left", // Set the icon name to "chevron.left"
            // - Fixme: ⚠️️ use Metric.accessoryIconSize? 👈
            iconSize: 16, // Set the icon size to 16
            padding: 16, // Set the padding to Measure.margin
            iconColor: style.iconColor, // Set the icon color to white or black
            backgroundColor: style.bgColor, // Set the background color to gray with 0.2 opacity
            strokeColor: style.borderColor, // Set the stroke color to white or black with 0.5 opacity
            strokeWidth: 1 // Set the stroke width to 1
         )
         // fix: add isTest as internal var etc
//         .background(isTest ? .green : .clear) // ⚠️️ debug
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
    */
   fileprivate var nextBtn: some View {
      Button(action: { self.onNextButtonPress?() }) {}
         // .chevronButtonStyle(systemName: "chevron.right")
         .headerIconStyle(
            // - Fixme: ⚠️️ Move to a const
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
