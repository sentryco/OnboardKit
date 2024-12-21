import SwiftUI

extension OnboardView {
   /**
    * A closure that is called when the onboarding is complete.
    * - Description: This closure is triggered when the user completes the
    *                onboarding process. It can be used to perform any necessary
    *                actions or updates after the user has finished the onboarding.
    */
   public typealias OnOnboardingComplete = () -> Void
   /**
    * The default closure that is called when the onboarding is complete.
    * - Description: This is the default closure that is called when the
    *                onboarding process is completed. It currently prints a
    *                debug message to the console. This can be replaced with
    *                any action that needs to be performed after the onboarding
    *                process.
    */
   public static let defaultOnOnboardingComplete: OnOnboardingComplete = {
      Swift.print("default onComplete")
   }  // Used to trigger login-view
   /**
    * - Fixme: ⚠️️ add doc
    */
   public typealias OnOnboardingPageChange = (_ idx: Int) -> Void
   public static let defaultOnOnboardingPageChange: OnOnboardingPageChange = { _ in }
}
