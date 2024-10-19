import SwiftUI
/**
 * Preview for onboarding (iOS and macOS) (Dark-mode)
 * - Description: This is a preview of the onboarding process for both iOS
 *                and macOS in dark mode. It provides a visual representation
 *                of how the onboarding view will appear to users during the
 *                actual onboarding process.
 * - Note: The translucent is demoed in the `OnboardContainer` preview
 * - Fixme: ⚠️️ add an abstract description
 */
#Preview(traits: .fixedLayout(width: 420, height: 640)) {
   ZStack(alignment: .top) { // Needed for dark scheme and dark bg to work etc
      Rectangle()
         .fill(Color.secondaryBackground) // background
         .ignoresSafeArea(.all)
      OnboardView(pageModels: OnboardModel.dummyModels)
         #if os(macOS)
         .frame(width: 420, height: 640) // ⚠️️ Must be here
         #endif
   } // End of zstack
   .environment(\.colorScheme, .dark)
}
