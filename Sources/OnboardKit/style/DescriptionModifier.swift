import SwiftUI
import HybridColor
/**
 * Used for onboarding for descripton text
 * - Description: A view modifier that provides a consistent style for
 *                description text in onboarding screens, including color
 *                adjustments for light and dark modes, centered text
 *                alignment, and increased line spacing for better readability.
 * - Note: Alt name: `OnboardDescModifier`
 */
fileprivate struct DescriptionModifier: ViewModifier {
   /**
    * This function applies the DescriptionModifier to the given content
    * - Parameter content: The content to be modified with the DescriptionModifier
    * - Returns: A view with the DescriptionModifier applied
    */
   fileprivate func body(content: Content) -> some View {
      // - Fixme: ⚠️️ Use a color from Pallet const lib? or move to const?
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
   PreviewContainer {
      let brand: String = "Apple" 
      return Text(brand)
         .descriptionStyle
         .padding()
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
