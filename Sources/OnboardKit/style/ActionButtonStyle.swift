import SwiftUI
import HybridColor
/**
 * Used for onboarding
 * - Description: A button style designed for primary actions in onboarding
 *                flows, providing a prominent visual cue for users to proceed
 *                with the next step. This style emphasizes the button with a
 *                capsule shape and a clear call-to-action, ensuring high
 *                visibility and accessibility.
 * - Note: similar to `SecondaryButtonStyle`, - Fixme: ⚠️️ reuse that instead?
 * - Fixme: ⚠️️ Move view-modifier into own file? with a preview etc?
 * - Fixme: ⚠️️ Move foregroundColor to buttonstyle?
 * - Fixme: ⚠️️ buttonstyle might not be needed ? .buttonStyle(.plain)
 */
fileprivate struct ActionButtonStyle: ButtonStyle {
   /**
    * Provides the visual representation of the button style.
    * - Description: This method is responsible for defining the appearance
    *                and interactive behavior of buttons that adopt the
    *                ActionButtonStyle.
    * - Parameter configuration: The configuration of the button, which provides the label and other properties needed to style the button.
    */
   fileprivate func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .padding()
         .frame(maxWidth: .infinity/*, maxHeight: 44*/) // Padding around text
//         .padding(.vertical, 12)
         .font(.system(.body)) // Text
         .foregroundColor(Color.whiteOrBlack)
         .actionButtonViewModifier // Resets button style I think
   }
}
/**
 * Convenient
 */
extension Button {
   /**
    * Convenient
    * - Fixme: ⚠️️ Make this a var?
    */
   internal func actionButtonStyle() -> some View {
      let style = ActionButtonStyle()
      return self.buttonStyle(style)
   }
}
/**
 * View modifier
 */
fileprivate struct ActionButtonViewModifier: ViewModifier {
   /**
    * body
    * - Parameter content: The content view that will be modified by this view modifier.
    * - Fixme: ⚠️️ Padding should be done in the caller?
    */
   fileprivate func body(content: Content) -> some View {
      content
         .background(
            Capsule() // Creates a capsule shape for the background
               .stroke(Color.whiteOrBlack.opacity(0.8), lineWidth: 2) // Strokes the capsule with a semi-transparent white or black color
         )
         .contentShape(Capsule()) // hit area for the button
//         .padding(.horizontal, 20) // padding around background
         // - Fixme: ⚠️️ the max size should be done in the caller no?
         .isMacOrIPad {
            $0.frame(width: 360) // max width for medium or large devices
         }
         // .background(.purple) // debug
   }
}
/**
 * Convenient ext
 */
extension View {
   /**
    * Modifier
    */
   fileprivate var actionButtonViewModifier: some View {
      let modifier = ActionButtonViewModifier()
      return self.modifier(modifier)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ add PreviewContainer
 */
#Preview(traits: .fixedLayout(width: 300, height: 200)) {
   PreviewContainer {
      Button {
         Swift.print("action")
      } label: {
         Text("Action button")
      }
      .actionButtonStyle()
      .padding(.horizontal, 20)
      .padding(.vertical)
      .background(Color.blackOrWhite)
      #if os(macOS)
      .padding(.horizontal)
      #endif
   }
}
