import SwiftUI
/**
 * Standard onboard page
 * - Abstract: The "main-view" for the onboarding
 * - Description: This view represents a single page in the onboarding
 *                process. It uses the provided model to display the page's
 *                title, description, and actions. It also manages the
 *                presentation of sheets, which are used for additional user
 *                interactions during the onboarding process.
 * - Note: Design inspo: text styles from: https://github.com/Krupanshu-Sharma/OnBoardingViewSwiftUI/blob/main/OnBoardingViewSwiftUI/OnBoardingViewSwiftUI/View/FruitCardView.swift
 * - Note: Design inspo: https://medium.com/@sharma17krups/onboarding-view-with-swiftui-b26096049be3
 * - Note: Design inspo: Neumorphic to button?: https://sarunw.com/posts/swiftui-buttonstyle/
 * - Note: Design inspo: and https://sarunw.com/posts/how-to-create-neomorphism-design-in-swiftui/
 * - Note: Design inspo: and https://github.com/costachung/neumorphic and https://www.figma.com/community/file/1133043795722403790/neumorphism-dark-theme-ui
 * - Fixme: ⚠️️ Maybe we should make each page a view? instead of using data as the model? consider it etc, or use viewmodel observedobject etc?
 * - Fixme: ⚠️️ Improve the abstract with copilot
 * - Fixme: ⚠️️ Rename to OnboardView? or OnboardPage?
 */
internal struct OnboardPage: View {
    /**
     * The model for the onboard page view
     * - Description: This property holds the data model for the onboard page, 
     *                which includes the necessary information to display the content of the page.
     * - Fixme: ⚠️️ Why is this optional?
     */
   internal let model: OnboardModel?
   /**
    * This is used to manage the state of a sheet within the application. It allows for easy presentation and dismissal of sheets, making it a convenient tool for handling modal views.
    * - Description: This property is an instance of ObservableSheet, 
    *                which is used to manage the presentation state of a sheet within the application.
    *                It allows for easy control over the presentation and dismissal of sheets,
    *                making it a convenient tool for handling modal views in the onboarding process.
    * - Fixme: ⚠️️ We could get this from the above, some way, still relevant?
    * - Fixme: ⚠️️ We don't have to pass the entire object down, we can actually just pass the binding etc, see mainview, still relevant?
    */
   @StateObject internal var observableSheet: ObservableSheet = .init()
}
// ⚠️️ Deprecated
@available(*, deprecated, renamed: "OnboardPage")
internal typealias OnboardPageView = OnboardPage
