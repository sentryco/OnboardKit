import SwiftUI
/**
 * A class that allows us to show a sheet and also to rewind the sheet 
 * - Note: Alternative name: `ObservablePromptObj`
 * - Description: This class utilizes SwiftUI's `@Published` property wrapper to manage 
 *                the state of a sheet within an application.
 *                The `isPresenting` property indicates whether the sheet is currently being presented,
 *                and the `sheet` property holds the view to be presented as a sheet.
 *                When the `sheet` property is set, `isPresenting` is automatically
 *                updated based on whether a sheet is present or not.
 *                This allows for easy management of sheet presentation state within an application.
 * - Fixme: ⚠️️ Could we make all this an enum?
 * - Fixme: ⚠️️ Write about this in swiftui tips, include priv / public etc
 * - Fixme: ⚠️️ Why is this useful? what uses it? What does it solve? can we do this simpler?
 */
public class ObservableSheet: ObservableObject {
   /**
    * This is used to trigger presenting the sheet and also to rewind sheet etc
    * - Description: This property manages the visibility of the sheet.
    *                Setting it to true displays the sheet, while setting it to
    *                false hides it.
    * - Note: @Published is a property wrapper that automatically notifies any observers (such as SwiftUI views) when the value of the property changes.
    * - Note: this must be public, can't be priv pub. Because we also set it
    */
   @Published public var isPresenting: Bool = false
   /**
    * ref to sheeet to show
    * - Description: This property holds the view that is to be presented as a sheet. 
    *                When a new view is assigned to this property, the 'isPresenting' property is 
    *                automatically updated to reflect whether a sheet is currently being presented or not.
    * - Fixme: ⚠️️ We can move this and the bool into an observable obbject, easier to move around that way, do it after it works, see blog post about it etc
    */
   @Published public var sheet: AnyView? {
      didSet {
         isPresenting = sheet != nil
      } // ⚠️️ hack to only needing to set sheet etc
   }
}
