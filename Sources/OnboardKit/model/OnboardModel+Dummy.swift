import SwiftUI
/**
 * Dummy
 */
extension OnboardModel {
   /**
    * Dummy models
    */
   public static let dummyModels: OnboardModels = [
      dummyPage1, // Welcome page
      dummyPage2, // Privacy page
      dummyPage3 // Payment page
   ]
}
/**
 * Models
 */
extension OnboardModel {
   /**
    * Welcome page
    */
   static let dummyPage1: OnboardModel = {
      .init(
         title: "Welcome",
         description: "This is a short description",
         actions: []
      )
   }()
   /**
    * Privacy page
    */
   static let dummyPage2: OnboardModel = {
       
      return .init(
         title: "Privacy",
         description: "Understanding your rights is important",
         actions: [
            (
               buttonTitle: "Show privacy agreement",
               action: { (_ observableSheet: ObservableSheet?) in // attach action to button
                  // Swift.print("prompt autofill - show steps to complete autofill")
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
            )
         ]
      )
   }()
   /**
    * Payment page
    */
   static let dummyPage3: OnboardModel = {
      .init(title: "Payment",
            description: "Pay with in-app-purchase",
            actions: [
               (
                  buttonTitle: "Monthly $5.99", // Button title for the action
                  action: { _ in Swift.print("buy1") } // No action for this button
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
   }()
}
