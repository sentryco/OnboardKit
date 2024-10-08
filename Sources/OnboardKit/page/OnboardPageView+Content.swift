import SwiftUI
/**
 * Content
 * - Fixme: ⚠️️ Maybe make description have the same padding as action button
 */
extension OnboardPageView {
   /**
    * Body
    * - Description: This property represents the main content view of an onboard page. 
    *                It constructs the view by stacking the title, description, and action buttons vertically.
    *                The background color is set to teal for testing purposes, and a sheet configuration is applied to the entire stack.
    */
   var body: some View {
      let stack: some View = self.stack
      // .background(isTest ? .teal : .clear) // ⚠️️ debug
      return configSheet(view: stack)
   }
}
/**
 * Components
 */
extension OnboardPageView {
   /**
    * Stack
    * - Description: This view stacks the title, description, and action buttons vertically with custom spacing. 
    *                It's designed to center these elements on the screen, providing a clear and focused user interface for the onboarding process.
    * - Note: We use Spacers instead of VStack spacing, to have individual control over spacing,  space between text and title and buttons differs etc
    * - Fixme: ⚠️️ Rename to vStack?
    */
   @ViewBuilder
   fileprivate var stack: some View {
      VStack(
         alignment: .center, // Center horisontally
         spacing: Self.spacing
      ) {
         titleTextView // Top title
         descriptionTextView // Top description
         actionbuttons // Center buttons
      } // End of vstack
   }
   /**
    * Top title
    * - Description: This section of the code generates the title text for the onboarding view. 
    *                The title is fetched from the model and displayed on the screen.
    * - Fixme: ⚠️️ Move width value to const?
    */
   @ViewBuilder
   fileprivate var titleTextView: some View {
      if let title: String = model?.title { // Top title
         Text("\(title)") // Title
            .titleStyle
            // .background(isTest ? .indigo : .clear) // ⚠️️ debug
            .isMacOrIPad {
               $0.frame(maxWidth: Self.maxWidth) // Max width for medium or large devices
            }
      }
   }
   /**
    * Top description
    * - Description: This section of the code generates the description text for the onboarding view. 
    *                The description is fetched from the model and displayed on the screen.
    * - Fixme: ⚠️️ Move width value to const?
    * - Fixme: ⚠️️ Maybe make text bigger for macOS and iPad?
    */
   @ViewBuilder
   fileprivate var descriptionTextView: some View {
      if let description: String = model?.description { // bellow title
         Text("\(description)") // Description
            .descriptionStyle
            // .background(isTest ? .blue : .clear) // ⚠️️ debug
            .isMacOrIPad ({ // Max width for medium or large devices
               $0.frame(maxWidth: Self.maxWidth) // by using maxWidth, the text grows vertically when there is little wide space available
            }) // .background(.green) // Debug
            #if os(iOS)
            .padding(.horizontal, Self.horPadding)
            #elseif os(macOS)
            .padding(.horizontal, Self.horPadding)
            #endif
      }
   }
   /**
    * Center action-buttons
    * - Description: This section of the code generates the action buttons for the onboarding view. 
    *                Each button corresponds to an action defined in the model.
    *                When a button is clicked, it executes the associated action's closure,
    *                passing in the observableSheet as a parameter.
    *                This allows for dynamic control over the presentation of sheets within the onboarding process.
    * - Fixme: ⚠️️ Seems like adding type to actions isn't straight forward
    */
   @ViewBuilder
   fileprivate var actionbuttons: some View {
      if let actions = model?.actions { // buttons in the center
         VStack(spacing: Self.spacing) { // needed for custom spacing between buttons
            ForEach(Array(actions.enumerated()), id: \.offset) { (_: Int, _ action: OnboardModel.OnboardAction) in // horizontal list of buttons // ForEach(actions, id: \.self.buttonTitle) { action in // horizontal list of buttons
               // var view = self // ⚠️️ hack to get self to work with inout
               Button(action.buttonTitle) { // Creates a button with the action's title
                  action.action?(observableSheet) // Executes the action's closure with the observableSheet parameter
               }
               .actionButtonStyle() // Applies the action button style
               self.accessibilityIdentifier("pageButton") // Sets the accessibility identifier for the button // Accessibility.Onboarding.pageButton
               // .background(isTest ? .pink : .clear) // Sets the background color to pink for debugging purposes if isTest is true, otherwise clear
            }
         }
      }
   }
}
