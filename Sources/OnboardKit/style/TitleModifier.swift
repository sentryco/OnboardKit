import SwiftUI
/**
 * Used for onboarding
 * - Description: A view modifier that centralizes text, applies a large title
 *                font style, and sets the foreground color to adapt to dark or
 *                light mode. Intended for use in onboarding screens where
 *                prominent, attention-grabbing text is required.
 * - Important: ⚠️️ `TextFieldStyle` doesn't work on `Text`
 * - Note: This will work, but will apply to all view types
 * - Fixme: ⚠️️ Add this: System font that also scales (relative): https://stackoverflow.com/a/75720217/5389500 add this later when we upgrade to scaled and relative sizing etc
 */
fileprivate struct TitleModifier: ViewModifier {
   /**
    * This function applies the TitleModifier to the given content.
    * - Parameter content: The content to be modified with the TitleModifier.
    * - Returns: A view with the TitleModifier applied.
    * - Fixme: ⚠️️ Move font size to const
    */
   fileprivate func body(content: Content) -> some View {
      content
         .multilineTextAlignment(.center) // Aligns the text to the center of the view.
         .font(isPhoneDevice ? Font.largeTitle : .system(size: 38, weight: .bold)) // Sets the font style to large title. (a bit larger font for iPad and macOS)
         .fontWeight(.regular) // needed
         .foregroundColor(Color.whiteOrBlack) // Sets the foreground color to white or black.
   }
}
/**
 * ## Examples:
 * Text("Hello").titleText
 */
extension Text {
   /**
    * - Note: Alternative name: `onBoardTitleStyle`
    */
   internal var titleStyle: some View {
      let modifier = TitleModifier()
      return self.modifier(modifier)
   }
}
/**
 * Preview (Dark-mode / Light-mode)
 */
#Preview(traits: .fixedLayout(width: 400, height: 400)) {
   PreviewContainer {
      let brand = "Apple"
      return Text(brand)
         .titleStyle
         .padding()
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
