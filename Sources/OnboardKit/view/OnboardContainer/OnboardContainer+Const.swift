import SwiftUI
/**
 * Const
 */
extension OnboardContainer {
   /**
    * - Description: Type alias for a closure that takes a SwiftUI binding
    *                to a Boolean indicating the need for onboarding and returns a
    *                `Foreground` view component.
    */
   public typealias ForegroundClosure = (_ needsOnboarding: Binding<Bool>) -> Foreground
   /**
    * Type alias for a closure that returns a `Background` view component.
    */
   public typealias BackgroundClosure = () -> Background
}
