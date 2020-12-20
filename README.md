# SnapshotTesting-Nimble

[![Build Status](https://app.bitrise.io/app/23b0dd4d9cd8de7d/status.svg?token=9jeNz4F89YDKjGihy4bRVQ)](https://app.bitrise.io/app/23b0dd4d9cd8de7d)

Adds [Nimble](https://github.com/Quick/Nimble) matchers for [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing)

## Installation

### Cocoapods

SnapshotTesting-Nimble is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SnapshotTesting-Nimble' :git => 'https://github.com/bastianX6/swift-snapshot-testing-nimble.git'
```

### Swift Package Manager

Add the following line in your `Package.swft` dependencies section:

```swift
[
    .package(url: "https://github.com/bastianX6/swift-snapshot-testing-nimble.git",
            from: "0.3.0"),
]

```

Then, add `"SnapshotTesting-Nimble"` to your test target:

```swift
    .testTarget(
        name: "MyAppTests",
        dependencies: [
            "MyApp",
            "SnapshotTesting-Nimble",
        ]
    ),
```

## Example

You can run two example projects:

### Cocoapods

To run the example project, clone the repo, and run `pod install` from the `Example/Cocoapods` directory first.

### Swift Package Manager

Open the `SnapshotTesting-Nimble-Example.xcodeproj` project file located in `Example/SPM/SnapshotTesting-Nimble-Example` folder and run the tests.


## Author

DJ Mitchell, killectro@gmail.com

## License

SnapshotTesting-Nimble is available under the MIT license. See the LICENSE file for more info.
