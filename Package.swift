// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SnapshotTesting-Nimble",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .macOS(.v10_10),
    ],
    products: [
        .library(
            name: "SnapshotTesting-Nimble",
            targets: [
                "SnapshotTesting-Nimble",
                "SnapshotTesting-Nimble-ObjC",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
                 from: "1.8.1"),
        .package(url: "https://github.com/Quick/Nimble.git",
                 .upToNextMajor(from: "9.0.0")),
    ],
    targets: [
        .target(
            name: "SnapshotTesting-Nimble",
            dependencies: [
                "SnapshotTesting",
                "Nimble",
            ],
            path: "SnapshotTesting-Nimble/Classes"
        ),
        .target(
            name: "SnapshotTesting-Nimble-ObjC",
            dependencies: [
                "SnapshotTesting-Nimble",
            ],
            path: "SnapshotTesting-Nimble/Objc-Classes",
            cSettings: [
                .headerSearchPath("SnapshotTesting-Nimble/Objc-Classes"),
            ]
        ),
    ]
)
