import SwiftUI
/**
 * Dummy
 * - Fixme: ⚠️️ Fence this as debug only
 * - Fixme: ⚠️️ Or move it to an xcode proj embedded in the package? See SlideViewKit etc
 */
extension OnboardModel {
   /**
    * Dummy models
    * - Note: This is meant to be used as testing only
    */
   public static var dummyModels: OnboardModels {
      [
         dummyPage1, // Welcome page
         dummyPage2, // Privacy page
         dummyPage3 // Payment page
      ]
   }
}
/**
 * Models
 */
extension OnboardModel {
   /**
    * Welcome page
    */
   static var dummyPage1: OnboardModel {
      .init(
         title: "Welcome",
         description: "This is a short description",
         actions: []
      )
   }
   /**
    * Privacy page
    * - Note: Has example regarding how Sheet prompting works
    */
   static var dummyPage2: OnboardModel {
      .init(
         title: "Privacy",
         description: "Understanding your rights is important",
         actions: [
            (
               buttonTitle: "Show privacy agreement",
               action: { (_ observableSheet: ObservableSheet?) in // Attach action to button
                  // Ensure modifications to observableSheet are dispatched to the MainActor
                  DispatchQueue.main.async { // we can also do: Task { await MainActor.run { } }
                     observableSheet?.sheet = {
                        AnyView(
                           Button(action: {
                              observableSheet?.isPresenting = false // Dismiss the sheet
                           }, label: {
                              Text("Dismiss")
                           })
                        )
                     }()
                  }
               }
            )
         ]
      )
   }
   /**
    * Payment page
    */
   static var dummyPage3: OnboardModel {
      .init(title: "Payment",
            description: "Pay with in-app-purchase",
            actions: [
               (
                  buttonTitle: "Monthly $5.99", // Button title for the action
                  action: nil // No action for this button
               ),
               (
                  buttonTitle: "Yearly $49.99", // Button title for the action
                  action: { _ in Swift.print("buy2") } // No action for this button
               ),
               (
                  buttonTitle: "Life-time $199.99", // Button title for the action
                  action: { _ in Swift.print("buy3") } // No action for this button
               )
            ])
   }
}
