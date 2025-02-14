import SwiftUI
import HybridColor
/**
 * Used for onboarding
 * - Description: A button style that creates a capsule-shaped button,
 *                typically used in onboarding screens to navigate the user to the next
 *                step. It features a customizable background and text color, with a
 *                design that emphasizes prominence and encourages action.
 * - Note: Alt name: `pale-capsule-button-style` or `primarybuttonstyle`
 * - Fixme: ⚠️️ Make text sharper?
 * - Fixme: ⚠️️ Break out view-modifier to own file?
 */
fileprivate struct ContinueButtonStyle: ButtonStyle {
   /**
    * - Description: The background color of the button.
    */
   fileprivate let color: Color
   /**
    * - Description: The color of the button text.
    */
   fileprivate let textColor: Color
   /**
    * Body
    * - Fixme: ⚠️️ we should probably use contentShape for hit area as well, or does the clipshape do the same? check with copilot etc
    * - Parameter content: The content view to be modified.
    * - Returns: The modified view with the continue button style applied.
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .frame(maxWidth: .infinity) // 44
         .padding(.vertical, 16)
         .background(color) // Sets the background color of the button based on the color scheme
         .clipShape(Capsule()) // Clips the button shape to a capsule
         .foregroundStyle(textColor)
         // .buttonStyle(.plain) // Resets the button style to plain
//         .padding(.horizontal, 20) // Applies horizontal padding to the button
   }
}
/**
 * Documentation for ContinueButtonStyle
 * - Description: This section provides documentation for the `ContinueButtonStyle` struct, which defines the style for a button used primarily in onboarding flows. The style emphasizes a prominent, action-oriented appearance with a capsule shape and customizable colors for both the background and text.
 */
extension Button {
   /**
    * Continue
    * - Description: This extension provides a convenient method to apply
    *                the `ContinueButtonStyle` to a button.
    * - Note: `isEnabled state for buttons: (but only if Button is wrapped
    *         in a view struct)
    *         https://medium.com/geekculture/custom-swiftui-button-with-on-
    *         pressed-configuration-in-ios-13-145d78699fff
    * - Fixme: ⚠️️ make this a var?
    * - Parameter isEnabled: A Boolean value that determines whether the button is enabled.
    * - Returns: A view that applies the `ContinueButtonStyle` to the button.
    */
   internal func continueButtonStyle(isEnabled: Bool = true) -> some View {
      let style: ContinueButtonStyle = {
         let textColor = Color(
            light: .black.opacity(isEnabled ? 0.8 : 0.4),
            dark: .white.opacity(isEnabled ? 0.8 : 0.2)
         )
         let backgroundColor = Color(
            light: .gray.opacity(isEnabled ? 0.4 : 0.2),
            dark: .gray.opacity(isEnabled ? 0.3 : 0.2)
         )
         return .init(
            color: backgroundColor,
            textColor: textColor
         )
      }()
      return self.buttonStyle(style)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ add PreviewContainer, yes 
 */
#Preview(traits: .fixedLayout(width: 340, height: 300)) {
   // The closure is a mechanism to show the two states
   PreviewContainer {
      Button(action: {
         Swift.print("action")
      }, label: {
         Text("Button")
      })
      .continueButtonStyle(isEnabled: true) // - Fixme: ⚠️️ alternate somehow
      .frame(width: .infinity, height: 64)
      .padding(.horizontal, 20)
      .padding(.vertical)
      .background(Color.blackOrWhite)
      #if os(macOS)
      .padding(.horizontal)
      #endif
   }
}
