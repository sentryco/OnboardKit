// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "OnboardKit",
    platforms: [
      .macOS(.v14),
      .iOS(.v17)
    ],
    products: [
        .library(
            name: "OnboardKit",
            targets: ["OnboardKit"]),
    ],
    dependencies: [
      .package(url: "https://github.com/sentryco/HybridColor", branch: "main"),
      .package(url: "https://github.com/sentryco/PageControl", branch: "main"),
      .package(url: "https://github.com/sentryco/PageControllerView", branch: "main"),
      .package(url: "https://github.com/sentryco/HapticFeedback", branch: "main"),
      .package(url: "https://github.com/sentryco/BlurView", branch: "main"),
    ],
    targets: [
      .target(
         name: "OnboardKit",
         dependencies: [
            .product(name: "HybridColor", package: "HybridColor"),
            .product(name: "PageControl", package: "PageControl"),
            .product(name: "PageControllerView", package: "PageControllerView"),
            .product(name: "HapticFeedback", package: "HapticFeedback"),
            .product(name: "BlurView", package: "BlurView"),
         ]),
      .testTarget(
         name: "OnboardKitTests",
         dependencies: ["OnboardKit"])
    ]
)
