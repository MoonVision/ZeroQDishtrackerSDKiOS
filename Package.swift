// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dishtracker",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "Dishtracker",
            targets: [
                "Dishtracker"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.6.1")),
        .package(url: "https://github.com/mac-cain13/R.swift.Library", .upToNextMajor(from: "5.4.0")),
        .package(url: "https://github.com/SwipeCellKit/SwipeCellKit", .upToNextMajor(from: "2.7.1")),
        .package(url: "https://github.com/andreamazz/AMPopTip", .upToNextMajor(from: "4.4.0"))
    ],
    targets: [
        .binaryTarget(
            name: "DishtrackerCore",
            path: "DishtrackerCore/DishtrackerCore.xcframework"
        ),
        .target(
            name: "Dishtracker",
            dependencies: [
                .target(name: "DishtrackerCore"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Rswift", package: "R.swift.Library"),
                .product(name: "SwipeCellKit", package: "SwipeCellKit"),
                .product(name: "AMPopTip", package: "AMPopTip")
            ],
            path: "Source",
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("SwiftUI", .when(platforms: [.iOS])),
                .linkedFramework("AVFoundation", .when(platforms: [.iOS])),
                .linkedFramework("Vision", .when(platforms: [.iOS])),
                .linkedFramework("CoreMotion", .when(platforms: [.iOS]))
            ]
        )
    ]
)
