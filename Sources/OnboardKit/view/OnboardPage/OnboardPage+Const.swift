import Foundation

extension OnboardPage {
   /**
    * The standard vertical and horizontal spacing used between elements
    * - Description: This constant defines the vertical and horizontal spacing
    *                between elements within the onboarding pages to ensure
    *                consistent layout and visual appeal.
    * - Note: Alt name: `xySpacing`, `verHorSpacing`, `verticalHorizontalSpacing`
    */
   internal static let spacing: CGFloat = 12
   /**
    * The horizontal padding for elements in the OnboardPageView.
    * - Description: This constant defines the horizontal padding applied to
    *                elements within the onboarding pages. The padding value is
    *                adjusted based on the operating system to ensure optimal
    *                spacing and alignment of content.
    * - Note: Alt name: `horizontalPadding`
    */
   internal static let horPadding: CGFloat = {
      #if os(iOS)
      return 8  // Suitable for compact iOS interfaces
      #elseif os(macOS)
      return 32 // Increased padding for macOS to accommodate wider screens
      #endif
   }()
   /**
    * The maximum width for elements in the OnboardPageView.
    * - Description: This constant defines the maximum width that any element
    *                within the onboarding pages can occupy. This is used to
    *                ensure that elements do not stretch excessively on larger
    *                screens, maintaining a visually appealing and consistent
    *                layout across different devices.
    * - Abstract: Defines the maximum width that elements in the OnboardPageView can occupy, ensuring a consistent and visually appealing layout across different devices by preventing elements from stretching excessively on larger screens.
    * - Fixme: ⚠️️ Store in an injectable struct? like Sizes.swift etc?
    */
   internal static let maxWidth: CGFloat = 500
   /**
    * horizontal padding for buttons
    * - Fixme: ⚠️️ Store in an injectable struct? like Sizes.swift etc?
    */
   internal static let horizontalPadding: CGFloat = 24
}
