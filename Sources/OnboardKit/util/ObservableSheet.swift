import SwiftUI
/**
 * A class that allows us to show a sheet and also to rewind the sheet
 * - Abstract: - Fixme: ⚠️️ Add short abstract. use copilot etc
 * - Description: This class utilizes SwiftUI's `@Published` property wrapper to manage
 *                the state of a sheet within an application.
 *                The `isPresenting` property indicates whether the sheet is currently being presented,
 *                and the `sheet` property holds the view to be presented as a sheet.
 *                When the `sheet` property is set, `isPresenting` is automatically
 *                updated based on whether a sheet is present or not.
 *                This allows for easy management of sheet presentation state within an application.
 * - Note: Alternative name: `ObservablePromptObj`
 * - Fixme: ⚠️️ Could we make all this an enum?
 * - Fixme: ⚠️️ Why is this useful? what uses it? What does it solve? can we do this simpler?
 */
// @MainActor // ⚠️️ Added inorder to comply with swift 6.0
public class ObservableSheet: ObservableObject {
   /**
    * This is used to trigger presenting the sheet and also to rewind sheet etc
    * - Description: This property manages the visibility of the sheet.
    *                Setting it to true displays the sheet, while setting it to
    *                false hides it.
    * - Note: @Published is a property wrapper that automatically notifies any observers (such as SwiftUI views) when the value of the property changes.
    * - Note: this must be public, can't be priv pub. Because we also set it
    * - Fixme: ⚠️️ Add better abstract? use copilot?
    * - Fixme: ⚠️️ add doc regarding not using @Published vs using it in ObservableObject
    */
   @Published public var isPresenting: Bool = false
   /**
    * Ref to sheeet to show
    * - Description: This property holds the view that is to be presented as a sheet.
    *                When a new view is assigned to this property, the 'isPresenting' property is 
    *                automatically updated to reflect whether a sheet is currently being presented or not.
    * - Fixme: ⚠️️ We can move this and the bool into an observable obbject, easier to move around that way, do it after it works, see blog post about it etc
    * - Fixme: ⚠️️ Rewrite the description to be max 80char wide
    * - Fixme: ⚠️️ Add better abstract? use copilot?
    * - Fixme: ⚠️️ Can we use alert? or no? Or do we only use sheet, and from sheet we can use alert. Should we add support for standalone alert as well? does it already work?
    * - Fixme: ⚠️️ Doc the hack a bit more
    */
   @Published public var sheet: AnyView? {
      didSet { // ⚠️️ hack to only needing to set sheet etc
         isPresenting = sheet != nil
      }
   }
}
