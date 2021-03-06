//
//  SnapshotTestingNimbleSpec.swift
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

class SnapshotTestingNimbleSpec: QuickSpec {
    override func spec() {
        describe("in arbitrary context") {
            describe("view image") {
                var view: NSView!

                beforeEach {
                    view = NSView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                    view.wantsLayer = true
                    view.layer?.backgroundColor = NSColor.blue.cgColor
                }

                it("has valid snapshot") {
                    expect(view).to(haveValidSnapshot(as: .image))
                    expect(view).to(haveValidSnapshot(as: .image, named: "some name"))
                    expect(view).to(haveValidSnapshot(as: .image, testName: "valid_image_snapshot"))
                }
            }

            describe("view recursive description") {
                var view: NSView!

                beforeEach {
                    view = NSView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                    view.wantsLayer = true
                    view.layer?.backgroundColor = NSColor.blue.cgColor
                }

                it("has valid snapshot") {
                    expect(view).to(haveValidSnapshot(as: .recursiveDescription))
                    expect(view).to(haveValidSnapshot(as: .recursiveDescription, named: "some name"))
                    expect(view).to(haveValidSnapshot(as: .recursiveDescription, testName: "valid_recursive_snapshot"))
                }
            }
        }
    }
}
