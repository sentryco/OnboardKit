[![Tests](https://github.com/sentryco/OnboardKit/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/OnboardKit/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/eb515b0e-475b-439a-81b9-28ec363ab04a)](https://codebeat.co/projects/github-com-sentryco-onboardkit-main)

# OnboardKit

> A clean toolkit for onboarding (iOS & macOS)    

<img width="355" alt="img" src="https://s11.gifyu.com/images/SBlzV.gif">

## Overview

- OnboardKit is a comprehensive SwiftUI library designed to simplify the creation of onboarding experiences for iOS and macOS applications. 
- Supply your own page models with title, description and buttons. 
- Customize the sheet content with your own views. Sheets are prompted via button actions. Button actions can also trigger other actions you wish to add.

## Features

- Dark / Light mode support 
- Subdued translucent background (app as background)
- Prompt sheet via button actions (from bottom for iOS, from top for macOS)
- Add custom steps via sheet (Great for aditional onboarding customizations)
- BYO page model (easily create model via array of tuples)
- Multiplatform iOS and macOS (iPad / iPhone / Mac)
- Left / right chevron buttons are added for macOS (Expected UX)
- Panning support for macOS (navigate left / right)

## Structure:
- `OnboardContainer`: ZStack wrapper w/ app + onboard-cover
- `OnboardCover`: VStack w/ contet + bottom-nav-bar  
- `OnboardPage`: Title, description, action-buttons. And sheet binding
- `PageContainer`: The swipe-carusel 
- `NavView`: Continue-button, Skip-button and dots
- `ControlOverlay` Has Previous and next arrow buttons (macOS only)
- `OnboardModel`: Title, description and action

## Usage

Here is a basic example of how to set up OnboardKit in your SwiftUI application:

```swift
import SwiftUI
import OnboardKit

@main
struct MyAppIOSApp: App {
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
         ZStack {
            Rectangle() // this is where the app main view goes
               .fill(Color.init(light: Color.lightGray.lighter(amount: 0.8), dark: Color.darkGray.darker(amount: 0.8))) // light or dark mode
            Text("Your app goes here")
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .edgesIgnoringSafeArea(.all)
      }
   }
}
```

## Installation

To integrate OnboardKit into your Xcode project using Swift Package Manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/sentryco/OnboardKit", branch: "main")
```
      
## Dependencies

OnboardKit utilizes these dependencies:

- Light and dark mode: [HybridColor](https://github.com/sentryco/HybridColor) 
- Page control for iOS: [PageControl](https://github.com/sentryco/PageControl) 
- Page controller for macOS: [PageControllerView](https://github.com/sentryco/PageControllerView) 
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
- [https://eon.codes/blog/2023/03/11/onboarding-best-practice/](https://eon.codes/blog/2023/03/11/onboarding-best-practice/) 

## TODO: 

- Clean up code ✅
- Add gif for macOS / iPad
- Add modal sheet example ✅
- Enable isTest in the scope of this package ✅
- Add high level doc regarding the simplistic approch with models that can have btns, title, decription, and popover sheet, and how this ultimatly makes making multipleplatform onbiarding a breeze, yet makes it possible to build powerful and complex onboarding experiences, while leaving the nitty gritty to this kit
- Add note regarding implemnting a lockable view with onboardview. How the structure will look etc, and link to the repo etc?
- Add a const struct that can be inject when initiating, that has variouse custom sizes etc
- Make some sort of style struct we can inject on init of onboardkit? ViewModifiers can be used with param drilliing etc
- Add access-id struct as well?
- Add demo xcodproj file like we do with SplitViewKit? 👈 instead of having the dummy code in the preview etc
- Add PreviewContainer class 👈
- Bump spm package to 6.0 and iOS 18 and macOS 15 etc 👈
- Add note in readme about importance of using frame width max infinity and edgeIgnores... etc
- Add emojies to the features list. Use gpt
- Figure out how to offset dots for iOS ?
