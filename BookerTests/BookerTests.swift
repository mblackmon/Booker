//
//  BookerTests.swift
//  BookerTests
//
//  Created by mblackmon on 12/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import XCTest
@testable import Booker

class BookerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsingSearchResponse() {
        guard let json = testJsonFor("testSearch") else {
            XCTFail("cannot proceed without testSearch.json file")
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let response = try? decoder.decode(SearchJSONResponse.self, from: json) else {
            XCTFail("could not decode json search response")
            return
        }
        debugPrint(#file, response.docs.count)
        //note: I usually use Nimble, so please forgive if this is not idiomatic
        XCTAssertTrue(response.docs.count == 93, "Expected 93 results")
        XCTAssertTrue(response.docs.first?.titleSuggest == "The Hobbit", "Expected The Hobbit")
        XCTAssertTrue(response.docs.first?.authorName.contains("J. R. R. Tolkien") ?? false , "Wrong Author Name")
        XCTAssertTrue(response.docs.first?.key == "/works/OL262758W", "Wrong key")
    }
    
    //MARK: Test Helper Functions
    func testJsonFor(_ name: String) -> Data? {
        let bundle = Bundle(for: type(of: self))
        let jsonPath = bundle.path(forResource: name, ofType: ".json")
        guard let path = jsonPath else {
            XCTFail("couldn't load resource for this test, can't find \(name).json in bundle")
            return nil
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            XCTFail("couldn't load data from raw json file at \(path)")
            return nil
        }
    }

}
