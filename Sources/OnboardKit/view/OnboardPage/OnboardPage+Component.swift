import SwiftUI
/**
 * Components
 */
extension OnboardPage {
   /**
    * Stack
    * - Fixme: ⚠️️ add abstract
    * - Description: This view stacks the title, description, and action buttons
    *                vertically with custom spacing. It's designed to center these
    *                elements on the screen, providing a clear and focused user
    *                interface for the onboarding process.
    * - Note: We use Spacers instead of VStack spacing, to have individual control
    *         over spacing, space between text and title and buttons differs etc
    * - Fixme: ⚠️️ Rename to vStack?
    */
   @ViewBuilder
   internal var stack: some View {
      VStack(
         alignment: .center, // Center horisontally
         spacing: Self.spacing
      ) {
         titleTextView // Top title (top)
         descriptionTextView // Top description (aligned under title)
         actionButtons // Center buttons (centered vertically)
      } // End of vstack
   }
}
/**
 * Private
 */
extension OnboardPage {
   /**
    * Top title
    * - Fixme: ⚠️️ Add abstract
    * - Description: This section of the code generates the title text for the onboarding view.
    *                The title is fetched from the model and displayed on the screen.
    * - Fixme: ⚠️️ Add padding?
    */
   @ViewBuilder
   fileprivate var titleTextView: some View {
      if let title: String = model?.title { // Top title
         Text("\(title)") // Title
            .titleStyle
            // add this later
            // .accessibilityAddTraits(.isHeader)
            .background(isOnboardTest ? .indigo : .clear) // ⚠️️ debug
            .isMacOrIPad { // target only iPad and mac
               $0.frame(maxWidth: Self.maxWidth) // Max width for medium or large devices
            }
      }
   }
   /**
    * Top description
    * - Fixme: ⚠️️ Add abstract
    * - Description: This section of the code generates the description text for the onboarding view.
    *                The description is fetched from the model and displayed on the screen.
    * - Fixme: ⚠️️ Maybe make text bigger for macOS and iPad?
    * - Fixme: ⚠️️ Add padding?
    */
   @ViewBuilder
   fileprivate var descriptionTextView: some View {
      if let description: String = model?.description { // bellow title
         Text("\(description)") // Description
            .descriptionStyle
            .background(isOnboardTest ? .blue : .clear) // ⚠️️ debug
            .isMacOrIPad { // Max width for medium or large devices
               $0.frame(maxWidth: Self.maxWidth) // by using maxWidth, the text grows vertically when there is little wide space available
            }
            .padding(.horizontal, Self.horPadding)
      }
   }
   /**
    * Create action-buttons (stacked from center vertically)
    * - Fixme: ⚠️️ add abstract
    * - Description: This section of the code generates the action buttons
    *                for the onboarding view. Each button corresponds to an
    *                action defined in the model. When a button is clicked, it
    *                executes the associated action's closure, passing in the
    *                observableSheet as a parameter. This allows for dynamic
    *                control over the presentation of sheets within the
    *                onboarding process.
    * - Fixme: ⚠️️ Seems like adding type to actions isn't straight forward
    */
   @ViewBuilder
   fileprivate var actionButtons: some View {
      if let actions = model?.actions { // buttons in the center
         VStack(spacing: Self.spacing) { // needed for custom spacing between buttons
            let array = Array(actions.enumerated())
            ForEach(array, id: \.offset) { (_: Int, _ action: OnboardModel.OnboardAction) in // horizontal list of buttons // ForEach(actions, id: \.self.buttonTitle) { action in // horizontal list of buttons
               Button(action.buttonTitle) { // Creates a button with the action's title
                  action.action?(observableSheet) // Executes the action's closure with the observableSheet parameter
               }
               .actionButtonStyle() // Applies the action button style
               .padding(.horizontal, Self.horizontalPadding)
               .accessibilityIdentifier(OnboardAccessID.pageButtonID) // Sets the accessibility identifier for the button // Accessibility.Onboarding.pageButton
               .background(isOnboardTest ? .pink : .clear) // Sets the background color to pink for debugging purposes if isTest is true, otherwise clear
            }
         }
      }
   }
}
