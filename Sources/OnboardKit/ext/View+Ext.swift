import SwiftUI
/**
 * Applies a closure to the view conditionally based on the platform and device type.
 * - Description: This method checks the current platform and device type to apply a closure to the view. It supports conditional application for iOS devices, including iPads and iPhones, as well as macOS devices.
 * - Note: This method is particularly useful for making platform-specific adjustments to your SwiftUI views, especially when you need to apply different styling or behavior on different devices or platforms.
 * - Parameter closure: A closure that takes the current view as a parameter and returns a view. This closure is applied to the view based on the platform and device type.
 * - Returns: The view with the closure applied if the condition is met, otherwise the original view.
 */
extension View {
   /**
    * Conditionally applies a closure to the view if the device is an iPad or a Mac.
    * - Description: This method checks if the current platform is iOS and if the device is an iPad. If both conditions are true, it applies the provided closure to the view. If the platform is macOS, it also applies the closure.
    * - Note: This method is particularly useful for making platform-specific adjustments to your SwiftUI views, especially when you need to apply different styling or behavior on iOS devices.
    * ## Examples:
    * Text("Hello, World!")
    *    .isMacOrIPad {
    *       $0.font(.largeTitle)
    *    }
    * - Parameter closure: A closure that takes the current view as a parameter and returns a view. This closure is applied to the view if the platform is iOS and the device is an iPad, or if the platform is macOS.
    * - Returns: The view with the closure applied if the platform is iOS and the device is an iPad, or if the platform is macOS, otherwise the original view.
    */
   @ViewBuilder // - Fixme: ⚠️️ might not be needed
   internal func isMacOrIPad<Content: View>(_ closure: (Self) -> Content) -> some View {
      #if os(iOS) // Check if the platform is iOS
      if UIDevice.current.userInterfaceIdiom == .pad { // Check if the device is an iPad
         closure(self) // Apply the closure to the view
      } else {
         self // Return the original view when the device is not an iPad
      }
      #elseif os(macOS) // Check if the platform is macOS
      closure(self) // Apply the closure to the view
      #endif
   }
}
/**
 * Sheet
 */
extension View {
   /**
    * A way to prompt fullscreen sheet or normal sheet
    * - Abstract: Presents a sheet that can be either full screen or not, based on the `isFullScreen` parameter.
    * - Description: This modifier conditionally presents a full-screen cover or a regular sheet based on the `isFullScreen` parameter. It allows for a flexible presentation style that can be adapted for different device types or user interface requirements.
    * - Note: Useful for cases where on iPhone a fullscreen sheet is better, but on iPad it looks better with a sheet that is not fullscreen
    * - Note: Use `UIDevice.isiPhone` `UIDevice.isiPad` etc to toggle fullscreen or not etc
    * - Note: There are examples for this. for instance in HistoryPreview
    * - Note: Given the current state of SwiftUI for macOS, if you need a sheet that dynamically resizes based on its content, you might consider implementing a custom solution that programmatically calculates and sets the sheet's size based on its content. This could involve measuring the content's size and then adjusting the sheet's size accordingly, although such an implementation would likely require significant customization and might not align perfectly with SwiftUI's declarative nature.
    * - Note: A workaround for managing sheet resizing involves using the .fixedSize() modifier on a VStack containing the sheet's content, which helps in adjusting the internal layout to fit the content's natural size but does not inherently make the sheet resizable based on its content 1.
    * - Note: Set the frame to match the window size
    * - Note: solution that dynamically sizes as well: https://www.phind.com/search?cache=g3aa84le913c7ineeahq9qnz
    * - Note: solution found here https://stackoverflow.com/a/72276942/5389500
    * - Note: parant geomreader: https://stackoverflow.com/a/66216585/5389500
    * - Note: setting fixedSize on stacks can work, but what about list?: https://stackoverflow.com/a/76526168/5389500
    * - Note: according to this link we can set different sheet sizes based on the content. so if the content size changes the sheet should too etc https://forums.developer.apple.com/forums/thread/657505
    * - Note: more sheet solutions with geomreader: https://stackoverflow.com/a/74495460/5389500
    * - Fixme: ⚠️️ We could pass an enum instead of isFullScreen, the enum could have different sheet size configs etc, do it later if needed etc
    * - Fixme: ⚠️️ Move to prompt/sheet/View+Prompt
    * - Fixme: ⚠️️ Rename the param isShowing to isPresented?
    * - Fixme: ⚠️️ a way to detect if sheet or alert is present on macOS is to reference the binding somewhere central, and then just check that binding when in need of checking if an alert or sheet is present. this is solved for iOS but not macOS. there might be other solutions as well, look into it.
    * - Fixme: ⚠️️⚠️️⚠️️ (very good) try this when adopting sheet indent for content size: https://stackoverflow.com/a/76915525/5389500
    * - Parameters:
    *   - isFullScreen: Determines if the sheet covers the full screen or not.
    *   - isShowing: A binding to a boolean that controls the visibility of the sheet.
    *   - onDismiss: A closure to execute when the sheet is dismissed.
    *   - content: The content to be displayed inside the sheet.
    * - Returns: The view with the sheet modifier applied.
    */
   @ViewBuilder
   internal func promptSheet<Content>(isFullScreen: Bool, isShowing: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content: View { // - Fixme: ⚠️️ can we just return Content here?
      if isFullScreen {
         #if os(iOS)
         self.fullScreenCover(isPresented: isShowing) { // Shows type-view
            content() // Calls the content view builder and returns the view.
         }
         #endif
      } else { // iPad / macOS / iPhone
         self.sheet(isPresented: isShowing) { // Presents a sheet based on the isShowing binding.
            content() // Calls the content view builder and displays the content within the sheet.
         }
      }
   }
}
