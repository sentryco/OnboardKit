import SwiftUI
/**
 * Onboarding model for the onboarding view 
 * - Description: This model represents a page in the onboarding process.
 *                It contains the title, description, and actions for the page.
 * - Note: Has some nice styles: https://betterprogramming.pub/custom-swiftui-toggle-styles-1b41959cf975
 * - Note: Has some nice colors: https://www.figma.com/community/file/997491162103772995/custom-toggle-in-swiftui
 * - Note: Ref: https://www.kodeco.com/books/real-world-ios-by-tutorials/v1.0/chapters/7-multi-module-app
 * - Fixme: ⚠️️ Add potential custom toggle: https://toddhamilton.medium.com/prototype-a-custom-toggle-in-swiftui-312f29f3a6c9
 * - Fixme: ⚠️️ Reuse some text styles here: https://github.com/Krupanshu-Sharma/OnBoardingViewSwiftUI/blob/main/OnBoardingViewSwiftUI/OnBoardingViewSwiftUI/View/FruitCardView.swift
 * - Fixme: ⚠️️ Move links to readme?
 */
public struct OnboardModel {
   /**
    * Page title
    * - Description: The title of the page that is displayed to the user during the onboarding process.
    */
   internal let title: String
   /**
    * Page description
    * - Description: The detailed explanation or information about the page
    *                that is displayed to the user during the onboarding process.
    */
   internal let description: String
   /**
    * The page actions
    * - Abstract: Called on button press, ref to observable sheet is passed in the action call, this way we can prompt a sheet, but its optional
    * - Description: The actions that can be performed on the page. Each
    *                action is represented by a button with a title and an
    *                associated function that is executed when the button is
    *                clicked.
    * - Fixme: ⚠️️ Make abstract max 80char wide
    */
   internal let actions: OnboardActions
   /**
    * Indicates if the sheet should be displayed in full screen.
    * - Description: This property determines whether the sheet presented during the onboarding process should occupy the entire screen.
    *                When set to `true`, the sheet will be displayed in full screen mode. When set to `false`, the sheet may be displayed with a different presentation style, such as a modal or a popover, depending on the context and platform.
    * - Fixme: ⚠️️ rename to presentFullScreen?
    */
   internal var isSheetFullScreen: Bool
   /**
    * Init (needed to support public scope)
    * - Parameters:
    *   - title: Page title
    *   - description: Page description
    *   - actions: Button title and action
    *   - isSheetFullScreen: Indicates if the sheet should be displayed in full screen.
    */
   public init(title: String, description: String, isSheetFullScreen: Bool = false, actions: OnboardActions) {
      self.title = title
      self.description = description
      self.isSheetFullScreen = isSheetFullScreen
      self.actions = actions
   }
}
// Bulk
public typealias OnboardModels = [OnboardModel]
