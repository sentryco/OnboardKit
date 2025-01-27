#if DEBUG

import SwiftUI
import HybridColor
/**
 * Preview for onboarding (iOS and macOS) (Dark-mode)
 * - Description: This section previews the OnboardContainer in dark mode
 *                for both iOS and macOS. It helps in visualizing the
 *                appearance and functionality of the onboarding process
 *                with a translucent background.
 * - Note: This shows the translucent background that works in preview
 * - Note: You can also put the `needOnboardin`g in a rebinder closure that changes userdefault
 */
#Preview(traits: .fixedLayout(width: 680, height: 440)) {
   @Previewable @State var isInNeedOfOnboarding: Bool = true
   let contentView = {
      OnboardContainer(needsOnboarding: $isInNeedOfOnboarding/*, pageIndex: $curPageIndex*/) { (_ needsOnboarding: Binding<Bool>/*, _ pageIndex: Binding<Int>*/) in
         OnboardCover(
            pageModels: OnboardModel.dummyModels,
            onPageChange: { (_ idx: Int) in // This line triggers an action when currentPageIndex changes.
               Swift.print("curPageIndex:  \(idx)")
               #if os(iOS)
               UIImpactFeedbackGenerator(style: .medium).impactOccurred()
               #endif
            }, onComplete: { (_ pageIndex: Int) in // If pageIndex is last, onboarding competed without being skipped
               Swift.print("pageIndex: \(pageIndex)")
               needsOnboarding.wrappedValue = false // Set when finishing onboarding
               #if os(iOS)
               UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
               #endif
            }
         )
      } background: {
         Rectangle() // this is where the app main view goes
            .fill(Color.blackOrWhite)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all) // Ignore safe area to cover entire screen if needed
      }
      .onChange(of: isInNeedOfOnboarding) { _, _ in
         Swift.print("isInNeedOfOnboarding:  \(isInNeedOfOnboarding)")
      }
   }()
   // ⚠️️ We need to return in preview or else Github actions doesn't build
   #if os(macOS)
   return contentView.frame(width: 680, height: 440) // Must be here
   #else
   return contentView
   #endif
//   .environment(\.colorScheme, .dark)
}
#endif
