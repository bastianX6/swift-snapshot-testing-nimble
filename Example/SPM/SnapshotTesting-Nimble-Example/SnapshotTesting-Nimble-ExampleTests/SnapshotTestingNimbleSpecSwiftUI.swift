//
//  SnapshotTestingNimbleSpecSwiftUI.swift
//  SnapshotTesting-Nimble-ExampleTests
//
//  Created by Bastián Véliz Vega on 19-12-20.
//

import Foundation
import Nimble
import Quick
import SnapshotTesting
import SnapshotTesting_Nimble
import SwiftUI

// This test was recorded with iPhone 11 (14.3)
class SnapshotTestingNimbleSpecSwiftUI: QuickSpec {
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
                    expect(view).to(haveValidSnapshot(as: .image))
                    expect(view).to(haveValidSnapshot(as: .image, named: "some name"))
                    expect(view).to(haveValidSnapshot(as: .image, testName: "valid_image_snapshot"))
                }
            }
        }
    }
}

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    static func image(drawHierarchyInKeyWindow: Bool = false,
                      precision: Float = 1,
                      size: CGSize? = nil,
                      traits: UITraitCollection = .init()) -> Snapshotting
    {
        Snapshotting<UIViewController, UIImage>.image(
            drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
            precision: precision,
            size: size,
            traits: traits
        )
        .pullback(UIHostingController.init(rootView:))
    }
}

public extension View {
    /// Wraps this view with a type eraser.
    /// - Returns: An `AnyView` wrapping this view.
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
