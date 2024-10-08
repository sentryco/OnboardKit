import SwiftUI
/**
 * Dummy
 */
extension OnboardModel {
   /**
    * Dummy models
    */
   public static let dummyModels: OnboardModels = [
      dummyPage1, // Welcome
      dummyPage2, // Privacy
      dummyPage3 // Payment
   ]
}
/**
 * Models
 */
extension OnboardModel {
   /**
    * Welcome
    */
   static let dummyPage1: OnboardModel = {
      .init(
         title: "Welcome",
         description: "This is a short description",
         actions: []
      )
   }()
   /**
    * Privacy
    */
   static let dummyPage2: OnboardModel = {
      .init(
         title: "Privacy",
         description: "Understanding your rights is important",
         actions: [
            (
               buttonTitle: "Show privacy agreement",
               action: { _ in Swift.print("Perform action here" ) }
            )
         ]
      )
   }()
   /**
    * Payment
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
