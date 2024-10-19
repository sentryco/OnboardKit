import SwiftUI
import PageControl
import HybridColor
import HapticFeedback
/**
 * Content
 * - Fixme: ⚠️️ See legacy regarding how it used haptic feedback for onboarding etc
 */
extension NavView {
   /**
    * Body
    * - Description: This is the main body of the NavView. It consists of a
    *                vertical stack (VStack) that contains the page control,
    *                action button, and dismiss button. The page control shows
    *                the current page in the onboarding process, the action
    *                button allows the user to proceed to the next page, and the
    *                dismiss button allows the user to skip the onboarding
    *                process.
    * - Fixme: ⚠️️ Add spacing in vstack?
    */
   var body: some View {
      VStack(spacing: .zero) {
         pageControl // Dots for macOS
         actionBtn // Continue / finish
         dismissBtn // Skip onboarding
      }
   }
}
/**
 * Components
 */
extension NavView {
   /**
    * Create `PageControl` instance
    * - Abstract: Dots for each page
    * - Description: This represents the dots indicating which page the user is currently on
    * - Remark: Custom dots: https://spin.atomicobject.com/2016/02/11/move-uipageviewcontroller-dots/
    * - Note: PageControl doesn't have any interaction events yet, might add in the future, iOS has this etc
    * - Fixme: ⚠️️ We can add interaction event for pagecontroller: `$0.addTarget(self, action: #selector(pageControlHandle), for: .valueChanged)` move this to pagecontrol github issues?
    * - Fixme: ⚠️️ I think we can just fence macOS here, and not return emptyview for iOS etc
    */
   @ViewBuilder // - Fixme: ⚠️️ Might not be needed
   fileprivate var pageControl: some View {
      #if os(iOS)
      EmptyView()
      #elseif os(macOS)
      PageControl(
         currentPage: $currentPage, // current page index
         numberOfPages: numOfPages, // total number of pages
         pageIndicatorTintColor: .gray.opacity(0.5), // color of inactive page indicator
         currentPageIndicatorTintColor: .whiteOrBlack // color of active page indicator
      )
         .padding(.vertical, 12) // - Fixme: ⚠️️ move value to const
      #endif
   }
   /**
    * Continue-button - Button has text with: `Skip onboarding` etc
    * - Abstract: Action button "Continue" etc
    * - Description: Button with text: `Continue`, or if last page: `All done`
    * - Fixme: ⚠️️ Try to add a more subtle stroke around continue-button ? 👈 yes maybe, do it later when tweaking design etc
    * - Fixme: ⚠️️ Make a universal feedback generator for all oses? so we can add it with one line?
    */
   fileprivate var actionBtn: some View {
      Button(buttonTitle) {
         onActionBtnPress?()
         #if os(iOS)
         UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
         #endif
      }
      .continueButtonStyle() // - Fixme: ⚠️️ Move this into style folder in this scope
      // .background(isTest ? .purple : .clear) // ⚠️️ Debug
      .animation(nil, value: currentPage) // Animates next view
      // - Fixme: ⚠️️ Use const here?
      .accessibilityIdentifier("actionButton") // Accessibility.Onboarding.actionButton
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
    * - Fixme: ⚠️️ Use HapticFeedback.play(.credentialsPasted) etc ? 👈
    * - Fixme: ⚠️️ Use const for width etc?
    * - Fixme: ⚠️️ Rename to skipButton?
    */
   fileprivate var dismissBtn: some View {
      Button(action: {
         onDismissBtnPress?() // Invokes the dismiss button press action handler
         #if os(iOS) // - Fixme: ⚠️️ Add support for disregarding haptic for macOS directly in the call etc
         HapticFeedback().vibrate() // Triggers a medium style haptic feedback
         #endif
      }, label: {
         Text(skipButtonTitle)
      })
      .skipButtonStyle() // - Fixme: ⚠️️ Move this style to this scope
      // .background(isTest ? .pink : .clear) // ⚠️️ debug
      // - Fixme: ⚠️️ Use const here?
      .accessibilityIdentifier("dismissButton") // Accessibility.Onboarding.dismissButton
      // .background(.green) // ⚠️️ Debug
      .isMacOrIPad {
         // - Fixme: ⚠️️ move value to const
         $0.frame(width: 360) // - Fixme: ⚠️️ Probably build this into the modifier etc?
      }
   }
}
