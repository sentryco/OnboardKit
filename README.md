[![Tests](https://github.com/sentryco/OnboardKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/OnboardKit/actions/workflows/Tests.yml)

# OnboardKit

> A clean toolkit for onboarding (iOS & macOS)    

## Overview

OnboardKit is a comprehensive SwiftUI library designed to simplify the creation of onboarding experiences for iOS and macOS applications. It provides a range of customizable components that can be easily integrated and adapted to fit the branding and functional requirements of your app.

## Features

- **Page Container**: Utilizes `PageContainer` to manage onboarding pages with swipe capabilities and dot indicators for navigation.
  - iOS: Implements a `TabView` with customizable appearance.
  - macOS: Uses a `PageControllerView` for managing page transitions.
  
- **Navigation View**: `NavView` includes navigation controls like a continue button, dismiss button, and page control, enhancing the user navigation experience through the onboarding flow.

- **Observable Sheet**: Manage modal sheets dynamically with `ObservableSheet`, which allows for presenting and dismissing views based on user actions.

- **Customizable Content**: Each onboarding page can be customized with titles, descriptions, and action buttons that are defined in the `OnboardPageView`.

- **Styling and Accessibility**: Extensive support for custom styles and accessibility features, ensuring that the onboarding process is inclusive and adaptable to various user needs.

## Installation

To integrate OnboardKit into your Xcode project using Swift Package Manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/sentryco/OnboardKit", branch: "main")
```

## Usage

Here is a basic example of how to set up OnboardKit in your SwiftUI application:

```swift
import SwiftUI
import OnboardKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
struct ContentView: View {
    @State var needsOnboarding: Bool = true
    var body: some View {
        OnboardContainer(needsOnboarding: $needsOnboarding) { (_ needsOnboarding: Binding<Bool>) in
            OnboardView(
                pageModels: OnboardModel.dummyModels, // point to your own onboarding models here
                onComplete: {
                    needsOnboarding.wrappedValue = false
                }
            )
        } background: {
            Rectangle() // this is where the app main view goes
                .fill(Color.blackOrWhite) // light or dark mode
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
```
      
## Dependencies

OnboardKit utilizes several dependencies to enhance its functionality.

- Light and dark mode: [HybridColor](https://github.com/sentryco/HybridColor) 
- Page control for iOS: [PageControl](https://github.com/sentryco/PageControl) 
- Page controller for macOS: [PageControllerView](https://github.com/sentryco/PageControllerView) 
- Haptic feedback: [HapticFeedback](https://github.com/sentryco/HapticFeedback) 
- Blur view support: [BlurView](https://github.com/sentryco/BlurView) 

## Resources: 
- https://sarunw.com/posts/how-to-create-neomorphism-design-in-swiftui/
- https://github.com/ciaranrobrien/SwiftUIPageView
- https://sarunw.com/posts/uikit-in-swiftui/ 
- https://github.com/exyte/ConcentricOnboarding 
- fancy custom advance onboarding: https://betterprogramming.pub/scroll-programatically-with-swiftui-scrollview-f080fd58f843
- https://github.com/fredyshox/PageView 
- https://stackoverflow.com/questions/58388071/how-can-i-implement-pageview-in-swiftui 
- Good tutorial for onboarding: https://medium.com/@sharma17krups/onboarding-view-with-swiftui-b26096049be3 
- https://github.com/Krupanshu-Sharma/OnBoardingViewSwiftUI 
- macos: https://github.com/ishaanbedi/Voyager/tree/main/Swift%20Post/Views/OnboardingViews

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests with any new features or fixes.

## License

OnboardKit is released under the MIT License. See [LICENSE](LICENSE) for details.

## TODO: 
- [ ] Fix bug crashing preview
- [ ] Clean up code
- [ ] Add gif for iOS and macOS
- [ ] Add modal sheet example