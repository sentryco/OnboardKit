import SwiftUI
import PageControllerView
/**
 * Content
 * - Fixme: ⚠️️ We can make a "container-view" of "tabview", see: https://stackoverflow.com/a/63159912
 */
extension PageContainer {
   /**
    * Body
    * - Description: This is the main body of the PageContainer.
    *                It consists of a containerContent view that changes
    *                based on the operating system.
    *                It also monitors the currentPageIndex and sends
    *                telemetry data when it changes.
    * - Note: @ViewBuilder is not needed for OS clauses like this
    * - Fixme: ⚠️️ add a callback here? or do we also have something similar elsewhere?
    */
   var body: some View {
      containerContent // - Fixme: ⚠️️ docthis line
         .onChange(of: currentPageIndex) { _, _ in // This line triggers an action when currentPageIndex changes.
            // - Fixme: ⚠️️ move this telemtry call to caller scope
            // TM.PageView.onboarding.pageView() // Ping telemetry
//            Swift.print("currentPageIndex: \(currentPageIndex)")
         }
   }
}
