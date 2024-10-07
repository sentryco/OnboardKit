import SwiftUI
/**
 * Has "continue-button", "dismiss-button" and "pageControl" 
 * - Abstract: The "pager-navigation-view" used to navigate between the onboarding pages.
 * - Description: The `NavView` struct defines a navigation view for the onboarding process.
 *                It includes a total number of pages, the current page being displayed,
 *                and actions for button presses. It is responsible for managing the navigation between different onboarding pages.
 * - Important: ⚠️️ Page-control is for macOS only, and is added automatically for iOS
 * - Note: https://github.com/nerd0geek1/NSPageControl
 * - Note: Inspo https://github.com/bfolder/BFPageControl
 * - Fixme: ⚠️️ Rename to something else? like? `PageNavView` or `PagerNavView`
 */
struct NavView: View {
   /**
    * The total number of pages in the navigation view.
    * - Description: This property represents the total number of pages in the onboarding process. 
    *                It is used to control the navigation and determine when the navigation buttons should be enabled or disabled.
    */
   let numOfPages: Int
   /**
    * The current page being displayed in the navigation view.
    * - Description: This property represents the current page being displayed in the navigation view. 
    *                It is used to track the user's progress through the onboarding process and control the navigation between different pages.
    */
   @Binding var currentPage: Int
   /**
    * Action btn press - Callback for action
    * - Description: This closure is triggered when the action button is pressed. 
    *                It allows for custom behavior to be defined for the action button in the navigation view.
    */
   var onActionBtnPress: OnActionBtnPress?
   /**
    * Dismiss btn press - Callback for dismiss
    * - Description: This closure is triggered when the dismiss button is pressed. 
    *                It allows for custom behavior to be defined for the dismiss button in the navigation view.
    */
   var onDismissBtnPress: OnDismissBtnPress?
}
