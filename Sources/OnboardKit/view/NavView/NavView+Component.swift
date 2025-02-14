import SwiftUI
import PageControl
//import HybridColor
/**
 * Components
 */
extension NavView {
   /**
    * `NavView` Component Extension
    * - Description: This extension of `NavView` provides the essential UI components for the navigation view, including the vertical stack that organizes the page control, continue button, and skip button. It ensures consistent spacing and padding to maintain a cohesive layout throughout the onboarding process.
    */
   var stack: some View {
      VStack(spacing: Self.verticalSpacing) {
         #if os(macOS)
         pageControl // Dots for macOS
         #endif
         continueButton // Continue / Finish
         skipButton // Skip onboarding
      }
      .padding(.bottom, Self.bottomPadding)
   }
}
/**
 * Private
 */
extension NavView {
   /**
    * Create `PageControl` instance
    * - Abstract: Dots that represents each page
    * - Description: This represents the dots indicating which page the user is currently on
    * - Remark: Custom dots: https://spin.atomicobject.com/2016/02/11/move-uipageviewcontroller-dots/
    * - Note: `PageControl` doesn't have any interaction events yet, might add in the future, iOS has this etc
    * - Note: iOS has this in the `TabView` that we add in `PageContainer`
    * - Fixme: ⚠️️ We can add interaction event for pagecontroller: `$0.addTarget(self, action: #selector(pageControlHandle), for: .valueChanged)` move this to pagecontrol github issues?
    * - Fixme: ⚠️️ Move pageIndicatorTintColor and currentPageIndicatorTintColor to const?
    */
   #if os(macOS)
   fileprivate var pageControl: some View {
      PageControl(
         currentPage: $currentPage, // current page index
         numberOfPages: numOfPages, // total number of pages
         pageIndicatorTintColor: .gray.opacity(0.5), // color of inactive page indicator
         currentPageIndicatorTintColor: .whiteOrBlack // color of active page indicator
      )
   }
   #endif
   /**
    * Continue-button - Button has text with: "Skip onboarding" etc
    * - Abstract: Action button "Continue" etc
    * - Description: Button with text: `Continue`, or if last page: `All done`
    * - Fixme: ⚠️️ Try to add a more subtle stroke around continue-button ? yes maybe, do it later when tweaking design etc
    * - Fixme: ⚠️️ Make a universal feedback generator for all OSes? so we can add it with one line? I think there is one now in HapticFeedbackkit etc add support for style for universal call etc
    */
   fileprivate var continueButton: some View {
      Button(buttonTitle) {
         onActionBtnPress?()
      }
      .continueButtonStyle() // - Fixme: ⚠️️ Move this into style folder in this scope
      .padding(.horizontal, Self.horizontalPadding)
      .background(isOnboardTest ? .green : .clear) // ⚠️️ Debug
      .animation(nil, value: currentPage) // Animates next view
      .accessibilityIdentifier(OnboardAccessID.actionButtonID) // Accessibility.Onboarding.actionButton
      // - Fixme: ⚠️️ Add this somehow, add View+Ext in ext folder
      .isMacOrIPad { // limit width of pad device
         $0.frame(width: 360) // - Fixme: ⚠️️ Move this value to a const?
      }
   }
   /**
    * Skip button
    * - Abstract: Button with text: `Skip onboarding` or if last page its hidden
    * - Description: The skip button allows the user to bypass the onboarding
    *                process. It is visible on all pages except the last one,
    *                where it is hidden.
    * - Fixme: ⚠️️ Use const for width etc? yes. maybe set from init size param struct etc
    * - Fixme: ⚠️️ Figure out how to set frame for mac or iPad more cleanly etc, elaborate?
    */
   fileprivate var skipButton: some View {
      Button(action: {
         onDismissBtnPress?() // Invokes the dismiss button press action handler
      }, label: {
         Text(skipButtonTitle)
      })
      .skipButtonStyle() // - Fixme: ⚠️️ Move this style to this scope
      .padding(.horizontal, Self.horizontalPadding)
      .background(isOnboardTest ? .pink : .clear) // ⚠️️ debug
      .accessibilityIdentifier(OnboardAccessID.dismissButtonID) // Accessibility.Onboarding.dismissButton
      .isMacOrIPad {
         $0.frame(width: 360) // - Fixme: ⚠️️ Probably build this into the modifier etc?
      }
   }
}
