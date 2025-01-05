import SwiftUI
import HybridColor
/**
 * Cirle stroke, with icon inside, fill behind
 * - Description: A button style that features a circular stroke with an icon
 *                in the center, backed by a solid fill color. It is designed
 *                to be used for header icons such as back and more options,
 *                providing a clear and recognizable interactive element.
 * - Note: Used for back and more button in header and in onboarding
 * - Note: Alternative name: `HeaderIconButtonStyle`
 * - Fixme: ⚠️️ doc each variable
 * - Fixme: ⚠️️ Rename to something else
 * ## Examples:
 * IconButtonStyle(strokeColor, backgroundColor, iconColor, size, iconSize)
 */
fileprivate struct HeaderIconStyle: ButtonStyle {
   /**
    * Icon name
    * - Description: The name of the icon to be displayed on the button.
    */
   fileprivate let iconName: String
   /**
    * Icon size
    * - Description: The size of the icon to be displayed on the button.
    */
   fileprivate let iconSize: CGFloat
   /**
    * Icon color
    * - Description: The color of the icon to be displayed on the button.
    */
   fileprivate let iconColor: Color
   /**
    * Background color
    * - Description: The background color of the button.
    */
   fileprivate let backgroundColor: Color
   /**
    * Stroke color
    * - Description: The color of the stroke around the icon.
    */
   fileprivate let strokeColor: Color
   /**
    * Stroke width
    * - Description: The width of the stroke around the icon.
    */
   fileprivate let strokeWidth: CGFloat
   /**
    * Padding
    * - Description: The padding around the button.
    */
   fileprivate let padding: CGFloat
   /**
    * Creates the body of the button style.
    * - Parameter configuration: The configuration of the button, containing its label and other properties.
    * - Returns: A view that represents the body of the button.
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
      configuration.label // The label of the button
         .headerIconViewModifier( // Applies the headerIconViewModifier to the label
            iconName: iconName, // The name of the icon to be displayed on the button
            iconSize: iconSize, // The size of the icon to be displayed on the button
            padding: padding, // The padding around the button
            iconColor: iconColor, // The color of the icon to be displayed on the button
            backgroundColor: backgroundColor, // The background color of the button
            strokeColor: strokeColor, // The color of the stroke around the icon
            strokeWidth: strokeWidth // The width of the stroke around the icon
         )
   }
}
/**
 * - Note: Add extension ButtonStyle where Self == HeaderIconStyle later
 *         if we need to store the style for switching etc
 */
extension Button {
   /**
    * Applies the header icon style to the button.
    * - Description: This method applies a header icon style to a button, allowing customization of the icon's appearance, including its size, color, and stroke. It also provides options for padding and background color, making it versatile for different UI designs.
    * - Parameters:
    *   - iconName: The name of the icon to be displayed on the button.
    *   - iconSize: The size of the icon to be displayed on the button. Defaults to 16.
    *   - padding: The padding around the button. Defaults to Measure.margin.
    *   - iconColor: The color of the icon to be displayed on the button. Defaults to Color.whiteOrBlack.
    *   - backgroundColor: The background color of the button. Defaults to Color(light: .lightGray, dark: .darkGray).opacity(0.2).
    *   - strokeColor: The color of the stroke around the icon. Defaults to Color.whiteOrBlack.opacity(0.5).
    *   - strokeWidth: The width of the stroke around the icon. Defaults to 1.
    * - Fixme: ⚠️️ Move color consts to pallet?
    * - Fixme: ⚠️️ Make this as a view modifier as well?
    * - Fixme: ⚠️️ Move default vals into const
    * - Note: This style is used in the onboarding navigation controls, specifically for the back/previous button that appears at the bottom of onboarding pages. It creates a circular button with an icon and stroke outline that matches the system appearance.
    */
   internal func headerIconStyle(iconName: String, iconSize: CGFloat = 16, padding: CGFloat = 16, iconColor: Color = Color.whiteOrBlack, backgroundColor: Color = Color(light: .lightGray, dark: .darkGray).opacity(0.2), strokeColor: Color = Color.whiteOrBlack.opacity(0.5), strokeWidth: CGFloat = 1) -> some View {
      let buttonStyle: HeaderIconStyle = .init(
         iconName: iconName, // Sets the name of the icon to be displayed on the button
         iconSize: iconSize, // Sets the size of the icon to be displayed on the button
         iconColor: iconColor, // Sets the color of the icon to be displayed on the button
         backgroundColor: backgroundColor, // Sets the background color of the button
         strokeColor: strokeColor, // Sets the color of the stroke around the icon
         strokeWidth: strokeWidth, // Sets the width of the stroke around the icon
         padding: padding // Sets the padding around the button
      )
      return self.buttonStyle(buttonStyle)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ add PreviewContainer
 */
#Preview(traits: .fixedLayout(width: 200, height: 200)) {
   PreviewContainer {
      Button(action: {}) {}
         .headerIconStyle(
            iconName: "chevron.left",
            iconSize: 16,
            padding: 16,
            iconColor: Color.whiteOrBlack,
            backgroundColor: .gray.opacity(0.2),
            strokeColor: Color.whiteOrBlack.opacity(0.5),
            strokeWidth: 1
         )
         .padding()
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
