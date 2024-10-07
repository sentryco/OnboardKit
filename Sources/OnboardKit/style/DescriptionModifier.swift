import SwiftUI
import HybridColor
//import MockGen
/**
 * Used for onboarding for descripton text
 * - Description: A view modifier that provides a consistent style for description text in onboarding screens, including color adjustments for light and dark modes, centered text alignment, and increased line spacing for better readability.
 * - Fixme: ⚠️️ Rename to `OnboardDescModifier`?
 */
fileprivate struct DescriptionModifier: ViewModifier {
   /**
    * This function applies the DescriptionModifier to the given content
    * - Parameter content: The content to be modified with the DescriptionModifier
    * - Returns: A view with the DescriptionModifier applied
    */
   fileprivate func body(content: Content) -> some View {
      // - Fixme: ⚠️️ Use a color from Pallet const lib?
      let foregroundColor: Color = .init(
         light: .black.opacity(0.8),
         dark: .white.opacity(0.6)
      )
      return content
         .foregroundColor(foregroundColor) // Sets the foreground color of the text based on the calculated foregroundColor
         .font(isPhoneDevice ? .body : .title3) // A bit bigger text for mac and iPad
         .multilineTextAlignment(.center) // Aligns the text to the center of the view
         .lineSpacing(6) // Increases the line spacing between lines of text
   }
}
/**
 * Usage Text("Hello").titleText
 */
extension Text {
   /**
    * - Note: Alernative name: onBoardDescriptionStyle
    * - Description: Applies the DescriptionModifier to the text
    * - Returns: A view with the DescriptionModifier applied
    */
   internal var descriptionStyle: some View {
      let modifier = DescriptionModifier()
      return self.modifier(modifier)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 200, height: 200)) {
   let view = {
      let brand: String = "Apple" // ?? MockGen.randomBrand?.capitalized
      return Text(brand)
         .descriptionStyle
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
