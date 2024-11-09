import SwiftUI
/**
 * Used for onboarding
 * - Description: A view modifier that centralizes text, applies a large title
 *                font style, and sets the foreground color to adapt to dark or
 *                light mode. Intended for use in onboarding screens where
 *                prominent, attention-grabbing text is required.
 * - Important: ⚠️️ `TextFieldStyle` doesn't work on `Text`
 * - Note: This will work, but will apply to all view types
 * - Fixme: ⚠️️⚠️️ Add this: System font that also scales (relative): https://stackoverflow.com/a/75720217/5389500 add this later when we upgrade to scaled and relative sizing etc
 * - Fixme: ⚠️️ move this back into onboarding scope? if this is the only strict that uses it?
 */
fileprivate struct TitleModifier: ViewModifier {
   /**
    * This function applies the TitleModifier to the given content.
    * - Parameter content: The content to be modified with the TitleModifier.
    * - Returns: A view with the TitleModifier applied.
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
 * - Fixme: ⚠️️ add PreviewContainer
 */
#Preview(traits: .fixedLayout(width: 400, height: 400)) {
   let view = {
      let brand = /*MockGen.randomBrand?.capitalized ??*/ "Apple"
      return Text(brand)
         .titleStyle
         .padding()
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite.opacity(1))
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
   .environment(\.colorScheme, .dark)
}
