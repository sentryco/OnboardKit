import SwiftUI
import BlurView
/**
 * Content
 */
extension OnboardContainer {
   /**
    * Body
    * - Description: This is the main body of the OnboardContainer. It consists
    *                of a ZStack that contains the main app view and, if
    *                onboarding is needed, a translucent underlay and the
    *                onboarding view. The state of 'needsOnboarding' is monitored
    *                and any changes are reflected in the PrefsStore.
    * - Note: `scenePhase` handles background mode etc
    */
   public var body: some View {
      ZStack { // This ZStack layers the main app view with the onboarding components when needed.
         background() // Main view of the app
         if needsOnboarding { // if needs onboarding add the onboarding views
            underlay // Translucent background
            foreground($needsOnboarding) // Onboarding view
         }
      }
   }
}
