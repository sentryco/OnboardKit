import SwiftUI
/**
 * Getter
 */
extension NavView {
   /**
    * Title for action button
    * - Description: Return the "All Done" text if the current page is the last page, otherwise return the "Continue" text
    * - Fixme: ⚠️️ The wrapped part might not be needed
    */
   var buttonTitle: String {
      if $currentPage.wrappedValue == numOfPages - 1 { // is last
         Self.finishButtonTitle
      } else {
         Self.continueButtonTitle
      }
   }
   /**
    * Title for dismiss button
    * - Description: Return an empty string if the current page is the last page, otherwise return the default dismiss button title
    * - Fixme: ⚠️️ The wrapped part might not be needed
    */
   var skipButtonTitle: String {
      if $currentPage.wrappedValue == numOfPages - 1 { // is last
         "" // Empty string
      } else {
         Self.skipButtonTitle
      }
   }
}
