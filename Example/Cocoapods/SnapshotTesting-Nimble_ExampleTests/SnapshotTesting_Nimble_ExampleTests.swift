//
//  SnapshotTesting_Nimble_ExampleTests.swift
//  SnapshotTesting-Nimble_ExampleTests
//
//  Created by DJ Mitchell on 12/4/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import SnapshotTesting
import SnapshotTesting_Nimble

// This test was recorded with iPhone Xʀ (12.2)
class SnapshotTestingNimbleSpec: QuickSpec {

    override func spec() {
        describe("in arbitrary context") {
            describe("view image") {
                var view: UIView!

                beforeEach {
                    view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                    view.backgroundColor = .blue
                }

                it("has valid snapshot") {
                    expect(view).to(haveValidSnapshot(as: .image))
                    expect(view).to(haveValidSnapshot(as: .image, named: "some name"))
                    expect(view).to(haveValidSnapshot(as: .image, testName: "valid_image_snapshot"))
                }
            }

            describe("view recursive description") {
                var view: UIView!

                beforeEach {
                    view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                    view.backgroundColor = .blue
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
