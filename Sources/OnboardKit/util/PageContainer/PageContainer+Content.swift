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
    *                It consists of a containerContent view that changes based on the operating system.
    *                It also monitors the currentPageIndex and sends telemetry data when it changes.
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
/**
 * Components
 */
extension PageContainer {
   /**
    * - Description: This property provides a view that adapts to different operating systems, 
    *                displaying a `TabView` on iOS and a `PageControllerView` on macOS.
    */
   @ViewBuilder
   var containerContent: some View {
      #if os(iOS)
      tabView
      #elseif os(macOS)
      pageController
      #endif
   }
   /**
    * This is the pages and the small indicator (iOS)
    * - Description: This is the TabView for iOS that displays the onboarding pages with swipe capabilities. It also includes a small indicator to show the current page in the onboarding process.
    * - Fixme: ⚠️️ Move 120 into a const? or better, embed onboarding in a safeAreaInset, see mainview etc, figure out better way to add space at the bottom?
    * - Note: The implementation of `tabView` and `pageController` differ between iOS and macOS. On iOS, a `TabView` is used with a custom appearance, while on macOS, a `PageControllerView` is used to manage the display of pages.
    */
   #if os(iOS)
   fileprivate var tabView: some View {
      TabView(selection: $currentPageIndex) { // currentPageIndex is the 2-way binding
         content // This line injects the content view which dynamically generates the onboarding pages based on the pageModels data.
      } // .ignoresSafeArea()
      // - Fixme: ⚠️️ move the value to a const
      .padding(.bottom, 120) // Padding from the bottom
      .onAppear(perform: setupPageControlAppearance) // Configs iOS
      .tabViewStyle(.page) // This will hide this : .tabViewStyle(.page(indexDisplayMode: .never))
   }
   #endif // macOS doesn't support tab-view yet, so we just fade in each view etc
   /**
    * PageControllerView (macOS)
    * - Description: This is the PageControllerView for macOS that displays the onboarding pages with swipe capabilities. It also includes a small indicator to show the current page in the onboarding process.
    * - Description: This method configures the `PageControllerView` for macOS. It converts the indices of `pageModels` into an array of strings, sets up the `PageControllerView` with the data source, current page index binding, and effect view configuration, and defines a closure to create the view for each page. The closure uses the identifier string to get the index of the page model, then returns a view for that page model.
    */
   #if os(macOS)
   fileprivate var pageController: some View {
      // Converts the indices of pageModels into an array of strings
      let dataModel: [String] = Array(pageModels.indices).map { String($0) }
      return PageControllerView( // Initializes a PageControllerView
         dataSource: dataModel, // Data source for the PageControllerView
         currentPage: $currentPageIndex, // Current page index binding
         effectViewConfig: (material: .hudWindow, blendingMode: .withinWindow) // Effect view configuration
      ) { (_ identifier: String) in // ["View 1", "View 2", "View 3"]
         //Swift.print("makeView - id: \(identifier)")
         // Converts the identifier string to an integer, defaulting to -1 if conversion fails
         let idx: Int = Int(identifier) ?? -1
         // Swift.print("idx: \(idx)")
         let pageModel: OnboardModel = pageModels[idx] // currentPageIndex
         return AnyView(
            OnboardPageView(model: pageModel) // Display the onboarding page with the specified model
            // .offset(y: -14) // ⚠️️ contentInset bug fix (might be NScroller.contentInset) not related to ignoresSafeArea
         )
      }
   }
   #endif
   /**
    * The pages (iOS)
    * - Description: This is a view that generates the onboarding pages for iOS. 
    *                It iterates over the pageModels array and for each element,
    *                it creates an OnboardPageView with the corresponding model.
    *                The tag assigned to each page corresponds to its index in the array,
    *                which helps in tracking the current page during the onboarding process.
    * - Fixme: ⚠️️ Doc more, and mark as iOS only?
    */
   fileprivate var content: some View {
      // Iterates over the enumerated array with a closure that takes an index and an element as parameters.
      ForEach(Array(pageModels.enumerated()), id: \.offset) { (_ index: Int, _ element: OnboardModel) in
         OnboardPageView(model: element) // This line creates an OnboardPageView for each model in the pageModels array.
            .tag(index) // This makes the small indicator? not sure, could be more like id setter
      }
   }
}
/**
 * Config
 */
extension PageContainer {
   /**
    * Setup Page Control Appearance
    * - Description: This method configures the appearance of the page control for iOS devices. It sets the current page indicator tint color to white.
    * - Fixme: ⚠️️ Can we style the tab component more? is it needed?
    * - Fixme: ⚠️️ See legacy project on how to style this more etc, still relevant?
    */
   fileprivate func setupPageControlAppearance() {
      #if os(iOS)
      UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.white) // white
      #endif
   }
}
