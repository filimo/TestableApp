//
//  TestableAppTests.swift
//  TestableAppTests
//
//  Created by Viktor Kushnerov on 24.12.21.
//

import XCTest
import Resolver
@testable import TestableApp

class TestableAppTests: XCTestCase {
    private var service: NewsService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Resolver.register {
            NewsService.mockLoader()
            
        }
        service = NewsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadingNews() async throws {
        XCTAssertEqual(service.news.count, 0)
        try await service.fetchAllNews()
        XCTAssertGreaterThan(service.news.count, 0)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
