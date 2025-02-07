import PageControl
import SwiftUI
import PageControllerView
/**
 * Content
 * - Description: Extends OnboardView with a body property containing a ZStack
 *                of `pageContainer`, `navView`, and `controlOverlay` (macOS
 *                only); `pageContainer` displays onboarding pages and
 *                indicators, `navView` handles navigation, and `controlOverlay`
 *                provides macOS navigation buttons.
 * - Fixme: ⚠️️ See old legacy text copy, maybe use some of it?
 */
extension OnboardCover {
   /**
    * Body
    * - Description: This is the main body of the OnboardView, consisting of a
    *                ZStack that layers the `pageContainer`, `navView`, and
    *                `controlOverlay` (for macOS only), where `pageContainer`
    *                manages the display of onboarding pages and the page control
    *                indicator, `navView` manages the navigation controls, and
    *                `controlOverlay` provides navigation buttons for macOS users.
    * - Note: The translucency is done in the `OnboardContainer`
    * - Fixme: ⚠️️ should we call the ignoresSafeArea in the caller instead?
    */
   public var body: some View {
      stack
      #if os(macOS) // Only for macOS
      .ignoresSafeArea(.all) // ⚠️️ Removes some native default offset etc
      #endif
   }
}
