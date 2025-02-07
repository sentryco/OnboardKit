import SwiftUI
/**
 * Sheet
 */
extension OnboardPage {
   /**
    * Configures the sheet to be shown
    * - Description: This method configures a sheet to be shown on top of the
    *                provided view. It sets up the sheet to be non-fullscreen,
    *                binds its presentation state to the `observableSheet.isPresenting`
    *                property, and defines an empty closure for when the sheet is
    *                dismissed. The content of the sheet is set to the
    *                `observableSheet.sheet` property.
    * - Parameter view: The view to attach the sheet to
    */
   internal func configSheet(view: some View) -> some View {
      view.promptSheet( // Attaches a sheet to the view using the promptSheet modifier
         isFullScreen: model?.isSheetFullScreen ?? false, // Set the sheet to not be full screen
         isShowing: $observableSheet.isPresenting, // Bind the presentation state of the sheet
         onDismiss: {}, // Define an empty closure for when the sheet is dismissed
         content: { // Define the content of the sheet
            self.observableSheet.sheet // Return the sheet content
         } // End of Selection
      )
   }
}
