import SwiftUI
import PageControl
import HybridColor
import HapticFeedback
/**
 * Components
 */
extension NavView {
   /**
    * Create `PageControl` instance
    * - Abstract: Dots that represents each page
    * - Description: This represents the dots indicating which page the user is currently on
    * - Remark: Custom dots: https://spin.atomicobject.com/2016/02/11/move-uipageviewcontroller-dots/
    * - Note: PageControl doesn't have any interaction events yet, might add in the future, iOS has this etc
    * - Fixme: ⚠️️ We can add interaction event for pagecontroller: `$0.addTarget(self, action: #selector(pageControlHandle), for: .valueChanged)` move this to pagecontrol github issues?
    */
   #if os(macOS)
   internal var pageControl: some View {
      PageControl(
         currentPage: $currentPage, // current page index
         numberOfPages: numOfPages, // total number of pages
         pageIndicatorTintColor: .gray.opacity(0.5), // color of inactive page indicator
         currentPageIndicatorTintColor: .whiteOrBlack // color of active page indicator
      )
      .padding(.vertical, 12) // - Fixme: ⚠️️ move value to const
   }
   #endif
   /**
    * Continue-button - Button has text with: "Skip onboarding" etc
    * - Abstract: Action button "Continue" etc
    * - Description: Button with text: `Continue`, or if last page: `All done`
    * - Fixme: ⚠️️ Try to add a more subtle stroke around continue-button ? 👈 yes maybe, do it later when tweaking design etc
    * - Fixme: ⚠️️ Make a universal feedback generator for all OSes? so we can add it with one line? I think there is one now in HapticFeedbackkit etc add support for style for universal call etc
    * - Fixme: ⚠️️ Use const for access id ?
    */
   internal var actionBtn: some View {
      Button(buttonTitle) {
         onActionBtnPress?()
         #if os(iOS)
         UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
         #endif
      }
      .continueButtonStyle() // - Fixme: ⚠️️ Move this into style folder in this scope
      .background(isTest ? .green : .clear) // ⚠️️ Debug
      .animation(nil, value: currentPage) // Animates next view
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
    * - Fixme: ⚠️️ Use const for width etc?
    * - Fixme: ⚠️️ Rename to skipButton?
    * - Fixme: ⚠️️ Use const for access id?
    * - Fixme: ⚠️️ Move width value to const
    */
   internal var dismissBtn: some View {
      Button(action: {
         onDismissBtnPress?() // Invokes the dismiss button press action handler
         HapticFeedback.play(.entry)
      }, label: {
         Text(skipButtonTitle)
      })
      .skipButtonStyle() // - Fixme: ⚠️️ Move this style to this scope
       .background(isTest ? .pink : .clear) // ⚠️️ debug
      .accessibilityIdentifier("dismissButton") // Accessibility.Onboarding.dismissButton
      .isMacOrIPad {
         $0.frame(width: 360) // - Fixme: ⚠️️ Probably build this into the modifier etc?
      }
   }
}
