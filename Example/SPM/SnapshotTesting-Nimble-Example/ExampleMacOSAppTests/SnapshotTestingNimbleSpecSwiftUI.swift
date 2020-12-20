//
//  SnapshotTestingNimbleSpecSwiftUI.swift
//  SnapshotTesting-Nimble-ExampleTests
//
//  Created by Bastián Véliz Vega on 19-12-20.
//

import AppKit
import Foundation
import Nimble
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI

class SnapshotTestingNimbleSpecSwiftUI: QuickSpec {
    let size = CGSize(width: 50, height: 50)
    override func spec() {
        describe("in arbitrary context") {
            describe("view image") {
                var view: AnyView!

                beforeEach {
                    view = Text("Hello world")
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.blue)
                        .eraseToAnyView()
                }

                it("has valid snapshot") {
                    expect(view).to(haveValidSnapshot(as: .image(size: self.size)))
                    expect(view).to(haveValidSnapshot(as: .image(size: self.size), named: "some name"))
                    expect(view).to(haveValidSnapshot(as: .image(size: self.size), testName: "valid_image_snapshot"))
                }
            }
        }
    }
}

/*
 Code from: https://www.vadimbulavin.com/snapshot-testing-swiftui-views/
 */
extension Snapshotting where Value: SwiftUI.View, Format == NSImage {
    static func image(precision: Float = 1,
                      size: CGSize? = nil) -> Snapshotting
    {
        Snapshotting<NSViewController, NSImage>.image(
            precision: precision,
            size: size
        )
        .pullback(NSHostingController.init(rootView:))
    }
}

public extension View {
    /// Wraps this view with a type eraser.
    /// - Returns: An `AnyView` wrapping this view.
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
