import SwiftUI
/**
 * Action
 */
extension OnboardCover {
   /**
    * Go to next page (called by tapping continue btn)
    * - Abstract: Step forward in the onboarding pages
    * - Description: This function is used to navigate to the next page in
    *                the onboarding process. If the current page is the last
    *                one, it triggers the completion of the onboarding
    *                process and dismisses the onboarding view.
    */
   public func goToNextPage() {
      withAnimation { // Adds the page transition anim
         if currentPageIndex + 1 < pageModels.count {
            currentPageIndex += 1 // itterate by one
         } else { // Loop to first step 
            onComplete?(currentPageIndex) // Here we should dismiss onboarding
         }
      }
   }
   /**
    * Step backward
    * - Abstract: Step backward in the onboarding pages
    * - Description: This function is used to navigate to the previous page
    *                in the onboarding process. If the current page is the
    *                first one, it does nothing. Otherwise, it decreases the
    *                current page index by 1, effectively moving the user back
    *                one step in the onboarding process.
    */
   public func goToPrevPage() {
      withAnimation { // Adds the page transition anim
         if currentPageIndex > 0 { // If the current page index is less than or equal to 0, return
            currentPageIndex -= 1 // Set the index to the current page index minus 1
         }
      }
   }
}
