// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WatchCore",
    platforms: [
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "WatchCore",
            targets: ["WatchCore"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WatchCore",
            path: "Sources/WatchCore"
        ),
    ]
)
