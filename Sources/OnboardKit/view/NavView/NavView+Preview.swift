#if canImport(SwiftUI) && compiler(>=6.0) // ⚠️️ fix for ga bug
import SwiftUI
import HybridColor
/**
 * Preview the navview (Dark / light mode)
 * - Description: This section previews the NavView in both dark and light
 *                modes. It helps in visualizing the appearance and
 *                functionality of the navigation controls during the
 *                onboarding process.
 * - Fixme: ⚠️️ Add some extra background with gray tone etc, or add the newer version of previewcontainer that has that? 
 * - Fixme: ⚠️️ Add fixed layout again? for macOS etc?
 */
#Preview { // ⚠️️ We don't need fixed layout for this (traits: .fixedLayout(width: 300, height: 300))
   @Previewable @State var currentPage = 0
   return PreviewContainer {
      NavView( // This line initializes the NavView with the specified number of pages and current page bindings.
         numOfPages: 3,
         currentPage: $currentPage,
         onActionBtnPress: { Swift.print("action") },
         onDismissBtnPress: { Swift.print("dismiss") }
      )
      //#if os(macOS)
      .padding(.horizontal)
      //#endif
   }
}
#endif
