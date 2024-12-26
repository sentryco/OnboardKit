import SwiftUI
import PageControllerView
/**
 * Content
 * - Fixme: ⚠️️ We can make a "container-view" of "tabview", see: https://stackoverflow.com/a/63159912
 */
extension PageContainerView {
   /**
    * Body
    * - Description: This is the main body of the PageContainer.
    *                It consists of a containerContent view that changes
    *                based on the operating system.
    *                It also monitors the currentPageIndex and sends
    *                telemetry data when it changes.
    * - Note: @ViewBuilder is not needed for OS clauses like this
    */
   internal var body: some View {
      containerContent // Displays either a TabView (iOS) or PageControllerView (macOS) depending on the platform
   }
}
