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
@available(iOS 18.0, macOS 15.0, *) // ⚠️️ Fix for GA
#Preview(traits: .fixedLayout(width: 680, height: 440)) {
   @Previewable @State var isInNeedOfOnboarding: Bool = true
   @Previewable @State var curPageIndex: Int = 0
   OnboardContainerView(needsOnboarding: $isInNeedOfOnboarding, pageIndex: $curPageIndex) { (_ needsOnboarding: Binding<Bool>, _ pageIndex: Binding<Int>) in
      OnboardView(
         pageModels: OnboardModel.dummyModels,
         onPageChange: { idx in
            pageIndex.wrappedValue = idx
         }, onComplete: {
            needsOnboarding.wrappedValue = false // Set when finishing onboarding
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
      // if pageIndex + 1 == OnboardModel.dummyModels.count {
      //    TM.Misc.skippedOnboarding.event() // Ping telemetry
      // } else {
      //    TM.Misc.completedOnboarding.event() // Ping telemetry
      // }
   }
   .onChange(of: curPageIndex) { _, _ in // This line triggers an action when currentPageIndex changes.
      Swift.print("curPageIndex:  \(curPageIndex)")
      // TM.PageView.onboarding.pageView() // Ping telemetry
   }
   #if os(macOS)
   .frame(width: 680, height: 440) // Must be here
   #endif
   .environment(\.colorScheme, .dark)
}

