import SwiftUI
import HybridColor
/**
 * Used for onboarding
 * - Description: A button style designed for primary actions in onboarding flows, providing a prominent visual cue for users to proceed with the next step. This style emphasizes the button with a capsule shape and a clear call-to-action, ensuring high visibility and accessibility.
 * - Note: similar to SecondaryButtonStyle, - Fixme: ⚠️️ reuse that instead?
 * - Fixme: ⚠️️ Move view-modifier into own file? with a preview etc?
 * - Fixme: ⚠️️ Move foregroundColor to buttonstyle?
 * - Fixme: ⚠️️ buttonstyle might not be needed .buttonStyle(.plain) 
 */
internal struct ActionButtonStyle: ButtonStyle {
   /**
    * body
    */
   internal func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .padding()
         .frame(maxWidth: .infinity, maxHeight: 44) // Padding around text
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
    * - Fixme: ⚠️️ make this a var
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
    * - Fixme: ⚠️️ padding should be done in the caller?
    */
   func body(content: Content) -> some View {
      content
         .background(
            Capsule() // Creates a capsule shape for the background
               .stroke(Color.whiteOrBlack.opacity(0.8), lineWidth: 2) // Strokes the capsule with a semi-transparent white or black color
         )
         .contentShape(Capsule()) // hit area for the button
         .padding(.horizontal, 20) // padding around background
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
   internal var actionButtonViewModifier: some View {
      let modifier = ActionButtonViewModifier()
      return self.modifier(modifier)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 300, height: 200)) {
   let view = {
      Button {
         Swift.print("action")
      } label: {
         Text("Action button")
      }
      .actionButtonStyle()
      .padding(.vertical)
      .background(Color.blackOrWhite)
      #if os(macOS)
      .padding(.horizontal)
      #endif
   }()
   return ZStack {
      Rectangle() // A rectangle to fill the background
         .fill(Color.secondaryBackground) // Fills the rectangle with a secondary background color
         .ignoresSafeArea(.all) // Ignores the safe area on all sides
      VStack(spacing: .zero) { // A vertical stack with no spacing
         view // The content view
            .environment(\.colorScheme, .light) // Sets the environment to light mode
         view // The content view again
            .environment(\.colorScheme, .dark) // Sets the environment to dark mode
      }
   }
}
/**
 * - Fixme: ⚠️️ remove this?
 */
//extension ButtonStyle where Self == ActionButtonStyle {
//   static func actionButtonStyle() -> Self {
//      return .init()
//   }
//}
