import SwiftUI
/**
 * Onboarding model for the onboarding view 
 * - Description: This model represents a page in the onboarding process. It contains the title, description, and actions for the page.
 * - Note: Has some nice styles: https://betterprogramming.pub/custom-swiftui-toggle-styles-1b41959cf975
 * - Note: Has some nice colors: https://www.figma.com/community/file/997491162103772995/custom-toggle-in-swiftui
 * - Note: Ref: https://www.kodeco.com/books/real-world-ios-by-tutorials/v1.0/chapters/7-multi-module-app
 * - Fixme: ⚠️️ Add potential custom toggle: https://toddhamilton.medium.com/prototype-a-custom-toggle-in-swiftui-312f29f3a6c9
 * - Fixme: ⚠️️ Reuse some text styles here: https://github.com/Krupanshu-Sharma/OnBoardingViewSwiftUI/blob/main/OnBoardingViewSwiftUI/OnBoardingViewSwiftUI/View/FruitCardView.swift
 * - Fixme: ⚠️️ Figure out a way to pass in the model into the onboard component. then we could move onboarding to a package?
 * - Fixme: ⚠️️ Add a demo model that can be used in preview in the package etc
 */
struct OnboardModel {
   /**
    * Page title
    * - Description: The title of the page that is displayed to the user during the onboarding process.
    */
   let title: String
   /**
    * Page description
    * - Description: The detailed explanation or information about the page that is displayed to the user during the onboarding process.
    */
   let description: String
   /**
    * The page actions
    * - Description: The actions that can be performed on the page. Each action is represented by a button with a title and an associated function that is executed when the button is clicked.
    */
   let actions: [OnboardAction]
}
// Bulk
typealias OnboardModels = [OnboardModel]
