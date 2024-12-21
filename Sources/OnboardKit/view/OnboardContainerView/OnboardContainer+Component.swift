import SwiftUI
import BlurView
/**
 * Components
 */
extension OnboardContainerView {
   /**
    * Adds the translucent background underlay
    * - Description: This method creates a translucent underlay for the
    *                onboarding view. It returns a `View` that represents a
    *                rectangle with a clear fill, which is then modified to
    *                have a translucent effect. This underlay is used to create
    *                a subtle background for the onboarding process, enhancing
    *                the visual appeal of the onboarding experience.
    */
   internal var underlay: some View {
      Rectangle().fill(.clear) // Create a rectangle with clear fill
         .translucentUnderlay( // Apply translucent underlay effect
            overlayColor: Color(light: Color.white.opacity(0.1), dark: Color.black.opacity(0.6))
         )
   }
}
