import SwiftUI
import HybridColor
/**
 * Used in onboarding and bottom-bar
 * - Description: A button style that provides a minimalistic text button,
 *                typically used for skip actions in onboarding flows or as
 *                secondary actions in various parts of the app.
 * - Note: Alternate name: `blue-text-button` or `secondary-button-style`
 */
internal struct SkipButtonStyle: ButtonStyle {
   /**
    * body
    * - Fixme: ⚠️️ Use padding instead of height?
    * - Fixme: ⚠️️ Move height to const?
    */
   internal func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .frame(maxWidth: .infinity, maxHeight: 44) // Sets the maximum width to infinity and height to 44
         .foregroundColor(Color(light: .gray, dark: .gray)) // Sets the foreground color to gray for both light and dark modes
         .skipButtonViewModifier // Applies the skipButtonViewModifier to the view
   }
}
/**
 * convenient
 */
extension Button {
   /**
    * Style
    */
   internal func skipButtonStyle() -> some View {
      let style = SkipButtonStyle()
      return self.buttonStyle(style)
   }
}
/**
 * - Fixme: ⚠️️ Move to own file or? maybe, or maybe not?
 */
fileprivate struct SkipButtonViewModifier: ViewModifier {
   /**
    * body
    * - Fixme: ⚠️️ Move stroke values and padding to const?
    */
   fileprivate func body(content: Content) -> some View {
      content
         .background(
            Capsule()
               .stroke(.white.opacity(0), lineWidth: 2)
         )
         .padding(.horizontal, 20) // padding around background
   }
}
/**
 * Convenient ext
 */
extension View {
   /**
    * Modifier
    */
   fileprivate var skipButtonViewModifier: some View {
      let modifier = SkipButtonViewModifier()
      return self.modifier(modifier)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ add PreviewContainer
 */
#Preview(traits: .fixedLayout(width: 300, height: 300)) {
   PreviewContainer {
      Button {
         Swift.print("action")
      } label: {
         Text("Button")
            .padding()
            .frame(maxWidth: .infinity) // This expands to parent width
      }
      .skipButtonStyle()
      // .padding()
      .background(Color.blackOrWhite)
      #if os(macOS)
      .padding(.horizontal)
      #endif
   }
}
