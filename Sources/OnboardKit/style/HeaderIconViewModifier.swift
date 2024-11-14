import SwiftUI
import HybridColor
/**
 * View modifier
 * - Description: A view modifier that applies a header icon style to the view,
 *                including icon name, size, color, background color, stroke color,
 *                stroke width, and padding.
 * - Note: Used in many places that has an Icon
 * - Fixme: ⚠️️ Reuse other modifiers for some of the styling here etc
 * - Fixme: ⚠️️ Rename to something else?
 * - Fixme: ⚠️️ store style in tuple or struct?
 */
fileprivate struct HeaderIconViewModifier: ViewModifier {
   /**
    * The name of the icon to display.
    */
   fileprivate let iconName: String
   /**
    * The size of the icon to display.
    */
   fileprivate let iconSize: CGFloat
   /**
    * The color of the icon to display.
    */
   fileprivate let iconColor: Color
   /**
    * The color of the background to display.
    */
   fileprivate let backgroundColor: Color
   /**
    * The color of the stroke to display.
    */
   fileprivate let strokeColor: Color
   /**
    * The width of the stroke to display.
    */
   fileprivate let strokeWidth: CGFloat
   /**
    * The padding to use for the icon.
    */
   fileprivate let padding: CGFloat
}
/**
 * Content
 */
extension HeaderIconViewModifier {
   /**
    * Body
    * - Description: The body of the view modifier.
    * - Fixme: ⚠️️ Wrap the body content in a stack or something? 👈
    * - Fixme: ⚠️️ There might be a simpler way of adding both foreground color and stroke to a circle
    * - Parameter content: The content to display.
    * - Returns: A modified version of the content with the header icon view modifier applied.
    */
   @ViewBuilder // - Fixme: ⚠️️ Remove this when we add a stack
   fileprivate func body(content: Content) -> some View {
      content // - Fixme: ⚠️️ Remove this?
      ZStack(alignment: .init(horizontal: .center, vertical: .center)) {
         background // Background shape
         stroke // Stroke shape
         icon // Icon
      }
      .contentShape(Circle()) // Makes the entire button area tappable / pressable (or else only the dots become interactive)
   }
   /**
    * Background
    * - Fixme: ⚠️️ Make a background circle modifier for this, see similar code elsewhere
    * - Fixme: ⚠️️ Try to figure out how use padding for sizing?
    */
   fileprivate var background: some View {
      Circle() // icon
         .foregroundColor(backgroundColor)
         .frame(
            width: iconSize + padding, // Width of the background circle
            height: iconSize + padding, // Height of the background circle
            alignment: .center // Aligns the background circle to the center
         )
         .aspectRatio(contentMode: .fit) // - Fixme: ⚠️️ probably not needed
   }
   /**
    * Stroke
    *  - Fixme: ⚠️️ make a stroke circle modifier for this, see circle extension modifer code elsewhere
    */
   fileprivate var stroke: some View {
      Circle()
         .stroke(strokeColor, lineWidth: strokeWidth) // Applies a stroke to the circle with the specified stroke color and line width.
         .foregroundColor(.clear) // Sets the foreground color of the circle to clear, effectively making it transparent.
         .frame(
            width: iconSize + padding, // Width of the stroke circle
            height: iconSize + padding, // Height of the stroke circle
            alignment: .center // Aligns the stroke circle to the center
         )
         .aspectRatio(contentMode: .fit) // - Fixme: ⚠️️ Probably not needed
   }
   /**
    * Icon
    * - Description: The icon to display.
    * - Fixme: ⚠️️ Remake this as image modifier and make it more modular etc, find the image modifier code somewhere etc
    * - Fixme: ⚠️️ Use the icon modifier on this
    * - Returns: A modified version of the content with the header icon view modifier applied.
    */
   fileprivate var icon: some View {
      Image(systemName: iconName)
         .resizable() // Makes the image resizable
         .aspectRatio(contentMode: .fit) // Scales the image to fit within the aspect ratio of the circle. (// .fill .scaledToFit)
         .foregroundColor(iconColor) // Sets the foreground color of the image to the specified color.
         .frame(width: iconSize, height: iconSize) // Sets the size of the image to the specified width and height.
   }
}
/**
 * Convenient
 */
extension View {
   /**
    * Applies the header icon view modifier to the view.
    * - Note: We use this for `main-row-brand-icon` and `header-circle-icon`
    * - Fixme: ⚠️️ Add stroke to this?
    * - Fixme: ⚠️️ This could be better if we just made a struct? instead of a modifier, and instead add modifer to the icon at least? or?
    * - Parameters:
    *   - iconName: The name of the system icon to display.
    *   - iconSize: The size of the icon.
    *   - padding: The space between the icon edge and the outside.
    *   - iconColor: The color of the icon.
    *   - backgroundColor: The background color of the icon.
    *   - strokeColor: The color of the stroke around the icon.
    *   - strokeWidth: The width of the stroke around the icon.
    * - Returns: A modified version of the view with the header icon view modifier applied.
    */
   @warn_unqualified_access // ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-swiftui-modifiers-safer-to-use-with-warn-unqualified-access
   internal func headerIconViewModifier(iconName: String, iconSize: CGFloat = 16, padding: CGFloat = 16, iconColor: Color = .white, backgroundColor: Color = Color(light: Color.darkGray.opacity(0.1), dark: Color.darkGray.opacity(0.2)), strokeColor: Color = Color.blackOrWhite, strokeWidth: CGFloat = 2) -> some View {
      let modifier = HeaderIconViewModifier(
         iconName: iconName, // Sets the name of the system icon to display.
         iconSize: iconSize, // Sets the size of the icon.
         iconColor: iconColor, // Sets the color of the icon.
         backgroundColor: backgroundColor, // Sets the background color of the icon.
         strokeColor: strokeColor, // Sets the color of the stroke around the icon.
         strokeWidth: strokeWidth, // Sets the width of the stroke around the icon.
         padding: padding // Sets the space between the icon edge and the outside.
      )
      return self.modifier(modifier)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ add PreviewContainer
 */
#Preview(traits: .fixedLayout(width: 200, height: 200)) {
   let view = {
      EmptyView()
         .headerIconViewModifier(
            iconName: "heart",
            iconSize: 24,
            padding: 30,
            iconColor: .whiteOrBlack.opacity(0.8),
            backgroundColor: .whiteOrBlack.opacity(0.2),
            strokeColor: .whiteOrBlack.opacity(0.4),
            strokeWidth: 2
         )
         // .padding(0) // .frame(width: 44, height: 44)
         .padding(.vertical)
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }()
   return ZStack {
      Rectangle() // A rectangle to fill the background
         .fill(Color.secondaryBackground) // Fills the rectangle with a secondary background color
         .ignoresSafeArea(.all) // Ignores the safe area on all sides
      VStack(spacing: .zero) { // A vertical stack with no spacing
         view // The content view
            .environment(\.colorScheme, .light) // Sets the environment to light mode
         view // The content view again
            .environment(\.colorScheme, .dark) // Sets the environment to dark mode
      }
   }
}
