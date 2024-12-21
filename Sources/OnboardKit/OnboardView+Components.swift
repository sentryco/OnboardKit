import PageControl
import SwiftUI
import PageControllerView
/**
 * Components
 */
extension OnboardView {
   /**
    * Page-container (has pages and dots controller) (iOS / macOS)
    * - Description: The `PageContainer` view manages the display of onboarding
    *                pages and the page control indicator. It binds to the
    *                `currentPageIndex` to update the currently visible page and
    *                uses `pageModels` to populate the content of each page.
    */
   internal var pageContainer: some View {
      PageContainerView(
         currentPageIndex: $currentPageIndex, // Index of the current page
         pageModels: self.pageModels // Array of page models
      )
       .background(isTest ? Color.brown : .clear)
   }
   /**
    * Create `ControlOverlay` (has `left-button` and `right-button`) (macOS only)
    * - Abstract: Navigation arrow buttons (Left and right buttons)
    * - Description: The `ControlOverlay` is designed specifically for macOS,
    *                as it provides navigation buttons for users to manually
    *                navigate through the onboarding process. This is
    *                particularly useful on macOS, where swipe gestures are not
    *                as intuitive as they are on iOS devices. The overlay
    *                includes both previous and next buttons, allowing users to
    *                move through the onboarding pages at their own pace.
    * - Fixme: ⚠️️ Add the hide and show logic for control-overlay for macos, or less is more? (maybe do it!) just needs activating and some styling, elaborate?
    * - Fixme: ⚠️️ Should we add this for iPad as well? Probably not?
    */
   #if os(macOS)
   internal var controlOverlay: some View {
      ControlOverlay(
         currentPage: $currentPageIndex, // Index of the current page
         numOfPages: pageModels.count, // Total number of pages
         onPrevButtonPress: { // Add event callbacks
            goToPrevPage() // Go to the previous onboarding page
         }, onNextButtonPress: { // Add event callbacks
            goToNextPage() // Go to the next onboarding page
         })
   }
   #endif
   /**
    * Create `PagerNavView` instance (macOS and iOS) (on the bottom)
    * - Abstract: Has `action-btn`, `dismiss.btn` and `page-indicator` (dots)
    * - Description: The `PagerNavView` is designed to be platform-agnostic,
    *                providing a consistent navigation experience across both iOS
    *                and macOS. However, there are some subtle differences in its
    *                behavior and appearance between the two platforms. On iOS,
    *                the `PagerNavView` is optimized for touch-based navigation,
    *                with larger tap targets and a more prominent action button.
    *                On macOS, the `PagerNavView` is tailored for mouse and
    *                keyboard navigation, with a more compact layout and a focus
    *                on keyboard accessibility. Despite these differences, the
    *                core functionality of navigating through onboarding pages
    *                and completing the onboarding process remains consistent
    *                across both platforms.
    */
   internal var navView: some View {
      VStack(alignment: .center) { // Bottom-bar, center alignex
         Spacer() // Pins nav-view to the bottom
         NavView(
            numOfPages: pageModels.count, // Number of pages based on the count of pageModels
            currentPage: $currentPageIndex, // Current page index bound to currentPageIndex
            onActionBtnPress: { // Action when action button is pressed
               goToNextPage() // Go to the next onboarding page
            }, onDismissBtnPress: { // Action when dismiss button is pressed
               onComplete?() // Complete the onboarding process
            })
          .background(isTest ? .indigo : .clear) // ⚠️️ debug
      }
   }
}
