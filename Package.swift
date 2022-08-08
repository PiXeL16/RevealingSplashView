// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "RevealingSplashView",
    platforms: [
      .iOS(.v8)
    ],
    products: [
      .library(name: "RevealingSplashView", targets: ["RevealingSplashView"])
    ],
    targets: [
      .target(name: "RevealingSplashView", path: "RevealingSplashView"),
      .testTarget(name: "RevealingSplashViewTests", path: "RevealingSplashViewTests")
    ],
    swiftLanguageVersions: [.v5]
)
