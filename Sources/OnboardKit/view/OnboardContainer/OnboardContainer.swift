import SwiftUI
/**
 * A wrapper so we can have `onboarding-view` above the `main-view` etc
 * - Abstract: This struct serves as a wrapper to display the onboarding view above the main view.
 * - Description: The OnboardContainer struct is a wrapper that allows the onboarding 
 *                view to be displayed above the main view.
 *                It checks if onboarding is needed and accordingly presents the onboarding view.
 *                It also adds a translucent underlay for better visual hierarchy.
 * - Note: Also adds the translucent underlay etc
 */
public struct OnboardContainer<Foreground: View, Background: View>: View {
   /**
    * The state is used to determine if the onboarding is needed.
    * - Description: This binding variable is used to control the visibility of the onboarding view.
    *                If 'needsOnboarding' is true, the onboarding view is displayed to the user. Otherwise,
    *                the main view of the application is shown.
    * - Fixme: ⚠️️ Rename to isOnboardingComplete?
    */
   @Binding internal var needsOnboarding: Bool // This could potentially also be a state, ad then wrapp the binding in init
   /**
    * Onboarding foreground cover
    * - Description: This covers the app beneath. We use a semi translucent background so that the app behind can be slightly visible
    * - Note: Has a `needsOnboarding` binding param that is used to change the state of this struct
    */
   internal let foreground: ForegroundClosure
   /**
    *  App main view
    *  - Description: This is where the rest of your app concides
    */
   internal let background: BackgroundClosure
   /**
    * init
    * - Description: This initializer sets up the OnboardContainer view. It
    *                takes two closures as parameters, one for the foreground
    *                (onboarding view) and one for the background (main app
    *                view). It also initializes the 'needsOnboarding' state
    *                variable based on the user's onboarding status stored in
    *                the PrefsStore.
    * - Note: The initializer uses `@ViewBuilder` and `@escaping` closures for the `foreground` and `background` parameters to allow for flexible view composition. The `@ViewBuilder` attribute lets you pass a view-building closure, enabling the creation of complex view hierarchies. The closures are marked as `@escaping` because they are stored and used after the initialization completes, which requires them to outlive the initializer's execution scope.
    * - Parameters:
    *   - foreground: Onboarding cover
    *   - background: App main view
    *   - needsOnboarding: Use rebound user-default property
    */
   public init(needsOnboarding: Binding<Bool>, /*pageIndex: Binding<Int>, */@ViewBuilder foreground: @escaping ForegroundClosure, @ViewBuilder background: @escaping BackgroundClosure) {
      self._needsOnboarding = needsOnboarding
      self.foreground = foreground
      self.background = background
   }
}
// ⚠️️ Deprecated
@available(*, deprecated, renamed: "OnboardContainer")
public typealias OnboardContainerView = OnboardContainer
