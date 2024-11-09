import PageControl
import SwiftUI
import PageControllerView
/**
 * Adds a "dot-component" and "swipe-capabilities" etc (iOS and macOS)
 * - Abstract: This container is used to display the onboarding pages
 * - Description: The `PageContainer` struct is a view that displays the
 *                onboarding pages with a dot component and swipe capabilities.
 *                It also keeps track of the current page index in the
 *                onboarding process. It reduces complexity in the onboard-view
 *                and its background covers the entire device. The dot
 *                indicators' background can be shown or hidden using the
 *                `.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:
 *                .always))` property.
 * - Note: Background of this covers the entire device
 * - Note: Background behind the dot indicators: `.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))` // shows hides background beind dots (less is more) ref: https://developer.apple.com/documentation/swiftui/pagetabviewstyle
 * - Note: This container reduce complexity in onboard-view
 * - Note: We don't need preview for this, debug with `OnboardView+Preview` instead
 * - Note: This container is added to `OnboardView` as a subview
 * - Fixme: ⚠️️ Move this out of the util folder? and one level up instead?
 * - Fixme: ⚠️️ rename to PageContainerView?
 */
internal struct PageContainer: View {
   /**
    * - Description: The PageContainer struct is a view that displays the
    *                onboarding pages with a dot component and swipe
    *                capabilities. It also keeps track of the current page
    *                index in the onboarding process.
    */
   @Binding internal var currentPageIndex: Int
   /**
    * - Description: This binding variable keeps track of the current page index in the onboarding process.
    */
   internal let pageModels: OnboardModels
}
