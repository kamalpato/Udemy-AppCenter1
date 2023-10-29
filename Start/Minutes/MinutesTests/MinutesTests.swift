//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Yodu on 29/10/23.
//  Copyright © 2023 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

final class MinutesTests: XCTestCase {
    
    var entryUnderTest: Entry!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        entryUnderTest = Entry("Title", "Content")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryUnderTest = nil
    }
    
    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)

        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }
    
}
