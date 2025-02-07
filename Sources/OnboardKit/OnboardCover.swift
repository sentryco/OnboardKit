import SwiftUI
/**
 * This is the onboarding container for individual onboard pages
 * - Abstract: A view that shows a "welcome-message" to the user
 * - Description: This is the onboarding container for individual onboard pages.
 *                It manages the current index of the onboarding page being
 *                displayed, the array of page models for onboarding, and the
 *                callback for when onboarding completes. The onboarding API is
 *                fairly abstract / modular to support "what's new intro" in the
 *                future etc. It is also known as `OnboardContainerView`.
 * - Remark: The onboarding API is fairly abstract / modular to support "what's new intro" in the future etc
 * - Remark: We can use `.navigateForward` `.navigateBack` `.selectedViewController` `.navigateForward(to: 0)`
 * - Note: Alternative name: `OnboardContainerView`
 * - Note: Onboarding SwiftUI `iOS` and `macOS`: https://github.com/benjaminsage/iPages
 * - Note: https://github.com/demianturner/DTOnboarding
 */
public struct OnboardCover: View {
   /**
    * The current index of the onboarding page being displayed.
    * - Abstract: Desired page index to jump to
    * - Description: Calculate the frame that should scroll to based on the page control current page
    * - Note: We can debug this by changing the value
    */
   @State internal var currentPageIndex: Int // Set initial state
   /**
    * Array of page models for onboarding
    * - Description: This is an array of models that represent each page in the
    *                onboarding process. Each model contains the data necessary to
    *                populate the content of its corresponding onboarding page.
    */
   internal let pageModels: OnboardModels
   /**
    * Fixme: add description
    * - Note: Can be used as a callback so we can add telemetry etc
    */
   internal var onPageChange: OnOnboardingPageChange?
   /**
    * Callback signature for when onboarding completes
    * - Description: This is a callback that gets triggered when the onboarding
    *                process is completed. It can be used to perform any necessary
    *                actions or updates after the user has finished the onboarding.
    */
   internal var onComplete: OnOnboardingComplete?
   /**
    * A view that handles the onboarding flow by displaying a series of onboarding pages.
    * - Parameters:
    *   - pageModels: The models representing each page in the onboarding process.
    *   - currentPageIndex: A binding to the current page index. Defaults to 0.
    *   - onPageChange: An optional callback triggered when the current page changes.
    *   - onComplete: An optional callback triggered when the onboarding process completes.
    * - Note: This initializer is public to allow external modules to create instances of OnboardView.
    */
   public init(currentPageIndex: Int = 0, pageModels: OnboardModels, onPageChange: OnOnboardingPageChange? = defaultOnOnboardingPageChange, onComplete: OnOnboardingComplete? = defaultOnOnboardingComplete) {
      self.currentPageIndex = currentPageIndex
      self.pageModels = pageModels
      self.onPageChange = onPageChange
      self.onComplete = onComplete
   }
}
// fixme: remove this, we have gridview for debugging now etc
public var isOnboardTest: Bool = false // ⚠️️ debug
// ⚠️️ DEPRECATED
@available(*, deprecated, renamed: "OnboardCover")
public typealias OnboardView = OnboardCover
