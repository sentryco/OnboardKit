import SwiftUI
//import Auth
/**
 * Content
 */
extension OnboardContainer {
   /**
    * Body
    * - Description: This is the main body of the OnboardContainer. It consists of a ZStack that contains the main app view and, if onboarding is needed, a translucent underlay and the onboarding view. The state of 'needsOnboarding' is monitored and any changes are reflected in the PrefsStore.
    * - Note: `scenePhase` handles background mode etc
    */
   var body: some View {
      ZStack { // This ZStack layers the main app view with the onboarding components when needed.
         background() // Main view of the app
         if $needsOnboarding.wrappedValue { // if needs onboarding add the onboarding views
            underlay // Translucent background
            foreground($needsOnboarding) // Onboarding view
         }
      }
      .onChange(of: needsOnboarding) { (_ old: Bool, _ new: Bool) in // we have to set value here when state updates
         // Swift.print("needsOnboarding change - old: \(old), new: \(new)")
         // - Fixme: ⚠️️ here we should set
         $needsOnboarding.wrappedValue = new
//         PrefsStore.$shouldPresentOnboarding.wrappedValue = new
         // ⚠️️ We might need to call some kind of userdef update call, or ref PrefsStore.$shouldPresentOnboarding.wrappedValue to make sure it sticks etc
         // Swift.print("PrefsStore.$shouldPresentOnboarding.wrappedValue: \(PrefsStore.$shouldPresentOnboarding.wrappedValue)")
      }
   }
}
/**
 * Components
 */
extension OnboardContainer {
   /**
    * Adds the translucent background underlay
    * - Description: This method creates a translucent underlay for the onboarding view. It returns a `View` that represents a rectangle with a clear fill, which is then modified to have a translucent effect. This underlay is used to create a subtle background for the onboarding process, enhancing the visual appeal of the onboarding experience.
    */
   fileprivate var underlay: some View {
      Rectangle().fill(.clear) // Create a rectangle with clear fill
         .translucentUnderlay() // Apply translucent underlay effect
   }
}
