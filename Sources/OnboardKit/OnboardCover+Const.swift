import SwiftUI

extension OnboardCover {
   /**
    * A closure that is called when the onboarding is complete.
    * - Description: This closure is triggered when the user completes the
    *                onboarding process. It can be used to perform any necessary
    *                actions or updates after the user has finished the onboarding.
    */
   public typealias OnOnboardingComplete = (_ pageIndex: Int) -> Void
   /**
    * The default closure that is called when the onboarding is complete.
    * - Description: This is the default closure that is called when the
    *                onboarding process is completed. It currently prints a
    *                debug message to the console. This can be replaced with
    *                any action that needs to be performed after the onboarding
    *                process.
    */
   public static let defaultOnOnboardingComplete: OnOnboardingComplete = { (_ idx: Int) in
      Swift.print("default onComplete - idx: \(idx)")
   }  // Used to trigger login-view
   /**
    * A closure that is called when the onboarding page changes.
    * - Description: This closure is triggered whenever the user navigates to a
    *                different page during the onboarding process. It receives
    *                the index of the new page as a parameter, allowing for
    *                tracking or responding to page changes during onboarding.
    * - Parameter idx: The index of the new page that was navigated to.
    */
   public typealias OnOnboardingPageChange = (_ idx: Int) -> Void
   /**
    * The default closure that is called when the onboarding page changes.
    * - Description: This is the default closure that is called when the
    *                onboarding page changes. It currently does nothing. This
    *                can be replaced with any action that needs to be performed
    *                when the page changes during onboarding.
    */
   public static let defaultOnOnboardingPageChange: OnOnboardingPageChange = { _ in }
}
