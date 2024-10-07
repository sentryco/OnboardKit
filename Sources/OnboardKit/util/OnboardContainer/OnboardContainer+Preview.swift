import SwiftUI
//import InterfaceLib
import HybridColor
/**
 * Preview for onboarding (iOS and macOS) (Dark-mode)
 * - Description: This section previews the OnboardContainer in dark mode for both iOS and macOS. It helps in visualizing the appearance and functionality of the onboarding process with a translucent background.
 * - Note: This shows the translucent background that works in preview
 */
#Preview(traits: .fixedLayout(width: 680, height: 440)) {
   struct DebugView: View {
      @State var needsOnboarding: Bool = true // State must be inside a struct to work in preview
      var body: some View {
         OnboardContainer(needsOnboarding: $needsOnboarding) { (_ needsOnboarding: Binding<Bool>) in
            OnboardView(
               // - Fixme: ⚠️️ Make a dummy model for preview
               pageModels: OnboardModel.pageModels,
               onComplete: {
                  // Swift.print("finish onboarding")
                  needsOnboarding.wrappedValue = false // Set when finishing onboarding
               }
            )
         } background: {
            Rectangle() // this is where the app main view goes
               .fill(Color.blackOrWhite)
               .frame(maxWidth: .infinity, maxHeight: .infinity)
//               .edgesIgnoringSafeArea(.all) // Ignore safe area to cover entire screen if needed
         }
      }
   }
   return DebugView()
   #if os(macOS)
   .frame(width: 680, height: 440) // Must be here
   #endif
   .environment(\.colorScheme, .dark)
}
//let _ = {
//   PrefsStore.$shouldPresentOnboarding.wrappedValue = true // ⚠️️ Reset to test onboarding
//   // Swift.print("PrefsStore.$shouldPresentOnboarding.wrappedValue: \(PrefsStore.$shouldPresentOnboarding.wrappedValue)")
//}()

//         var needsOnboarding: Binding<Bool> { // We rebind user-default
//            .init {
//               PrefsStore.$shouldPresentOnboarding.wrappedValue
//            } set: { bool in
//               PrefsStore.$shouldPresentOnboarding.wrappedValue = bool
//            }
//         }
