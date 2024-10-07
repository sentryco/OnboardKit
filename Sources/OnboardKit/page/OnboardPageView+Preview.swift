import SwiftUI
import HybridColor
/**
 * Preview single onboarding page (dark-mode)
 * - Description: This section of the code previews a single onboarding page in dark mode for the application. It sets the environment color scheme to dark and tests the view with a pure black background.
 * - Fixme: ⚠️️ add debug view? if needed?
 */
#Preview(traits: .fixedLayout(width: 500, height: 500)) {
   OnboardPageView(model: OnboardModel.dummyPage1)
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea()
      .background(Color.blackOrWhite) // Test with pure white or pure black
      .environment(\.colorScheme, .dark) // .dark / .light
}
