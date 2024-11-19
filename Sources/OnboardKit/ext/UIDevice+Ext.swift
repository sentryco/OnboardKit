import SwiftUI
#if os(iOS) // Check if the target platform is iOS
import UIKit
#endif
/**
 * Is or isn't iphone
 * - Description: This variable checks if the current device is an iPhone.
 *                It returns true if the device is an iPhone, and false otherwise.
 *                This is useful for adjusting UI or functionality based on the
 *                device type.
 * - Note: We can get `isIpadOrMacos` by doin `!IsIphone` device
 */
@MainActor
internal var isPhoneDevice: Bool {
   #if os(iOS) // Check if the target platform is iOS
//   var isPhoneDevice: Bool? // ⚠️️ hack to comply to swift 6.0 - Fixme: ⚠️️ We might want to make this MainActor
//   DispatchQueue.main.sync {
     let device = UIDevice.current
     /*isPhoneDevice =*/ return device.userInterfaceIdiom == .phone // Return true if the device is an iPhone
//   }
//   guard let isPhoneDevice = isPhoneDevice else { fatalError("🚫 unable to obtain device") }
//   return isPhoneDevice
   #elseif os(macOS) // Check if the target platform is macOS
   return false // Return false as macOS is not an iPhone
   #endif
}
