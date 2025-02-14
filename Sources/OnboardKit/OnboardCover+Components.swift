import PageControl
import SwiftUI
import PageControllerView
/**
 * Components
 */
extension OnboardCover {
   /**
    * Stack
    */
   internal var stack: some View {
      #if os(macOS) // Only for macOS
      zStack
      #elseif os(iOS)
      vStack
      #endif
   }
}
/**
 * Private
 */
extension OnboardCover {
   /**
    * zStack
    */
   #if os(macOS)
   fileprivate var zStack: some View {
      ZStack {
         vStack // content + nav
         controlOverlay // Makes sense to have this on a device where swiping isnt abvious
      }
   }
   #endif
   /**
    * Vertical stack container for onboarding content
    * - Description: This view arranges the page container and navigation view in a vertical stack.
    *                The spacing between elements is set to zero to maintain precise layout control.
    * - Note: Used by both iOS and macOS targets, but wrapped in ZStack for macOS to support control overlay
    */
   fileprivate var vStack: some View {
      VStack(spacing: .zero) {
         pageContainer // Onboard-page
         navView // Bottom onboarding navigation bar
      }
   }
   /**
    * Page-container (has pages and dots controller) (iOS / macOS)
    * - Abstract: A container view that displays onboarding pages and their page indicators.
    * - Description: The `PageContainer` view manages the display of onboarding
    *                pages and the page control indicator. It binds to the
    *                `currentPageIndex` to update the currently visible page and
    *                uses `pageModels` to populate the content of each page.
    */
   fileprivate var pageContainer: some View {
      PageContainer(
         currentPageIndex: $currentPageIndex, // Index of the current page
         pageModels: self.pageModels // Array of page models
      )
         .background(isOnboardTest ? Color.brown : .clear)
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
    * - Fixme: ⚠️️ Should we add this for iPad as well? Probably not? yepp thats a no, ipad may be opened in narrow window etc, which would make things look strange. also swiping is a well known gesture on ipad etc, add this as a discussion point in the code docs instead?
    */
   #if os(macOS)
   fileprivate var controlOverlay: some View {
      ControlOverlay(
         currentPage: $currentPageIndex, // Index of the current page
         numOfPages: pageModels.count, // Total number of pages
         onPrevButtonPress: { // Add event callbacks
            goToPrevPage() // Go to the previous onboarding page
         }, onNextButtonPress: { // Add event callbacks
            goToNextPage() // Go to the next onboarding page
         }
      )
         .background(isOnboardTest ? .yellow.opacity(0.4) : .clear) // ⚠️️ debug
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
   fileprivate var navView: some View {
      NavView(
         numOfPages: pageModels.count, // Number of pages based on the count of pageModels
         currentPage: $currentPageIndex, // Current page index bound to currentPageIndex
         onActionBtnPress: { // Action when action button is pressed
            goToNextPage() // Go to the next onboarding page
         }, onDismissBtnPress: { // Action when dismiss button is pressed
            onComplete?(currentPageIndex) // Complete the onboarding process
         }
      )
         .background(isOnboardTest ? .indigo : .clear) // ⚠️️ debug
   }
}
