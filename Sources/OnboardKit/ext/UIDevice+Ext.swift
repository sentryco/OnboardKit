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
 * - Note: We can get isIpadOrMacos by doin !IsIphone device
 */
internal var isPhoneDevice: Bool {
   #if os(iOS) // Check if the target platform is iOS
   return UIDevice.current.userInterfaceIdiom == .phone // Return true if the device is an iPhone
   #elseif os(macOS) // Check if the target platform is macOS
   return false // Return false as macOS is not an iPhone
   #endif
}
