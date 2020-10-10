//
//  CommentServiceTests.swift
//  CleanarchTests
//
//  Created by Arifin Firdaus on 10/10/20.
//  Copyright © 2020 arifinfrds. All rights reserved.
//

import XCTest
@testable import Cleanarch
@testable import CleanarchDomain

class CommentServiceTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_fetchComments_given_invalidPostId_shouldReturnErrorCount1() {
        // given
        let postId = -99
        let sut: CommentService = CommentServiceImpl()
        var capturedErrors: [LoadCommentsError] = []
        let expectation = self.expectation(description: "Capture an error only 1")
        // when
        sut.fetchComments(postId: postId) { result in
            switch result {
            case .success(let comments):
                print(comments)
            case .failure(let error):
                capturedErrors.append(error)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
        
        // then
        XCTAssertEqual(capturedErrors.count, 1)
    }
    
    func test_fetchComments_given_invalidPostId_shouldReturnAnError() {
        // given
        let postId = -99
        let sut: CommentService = CommentServiceImpl()
        var capturedError: LoadCommentsError?
        let expectation = self.expectation(description: "Capture an error")
        // when
        sut.fetchComments(postId: postId) { result in
            switch result {
            case .success(let comments):
                print(comments)
            case .failure(let error):
                capturedError = error
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
        
        // then
        XCTAssertNotNil(capturedError)
    }
    
    func test_fetchComments_givenInvalidPostId_shouldReturnInvalidIdError() {
        // given
        let postId = -99
        let sut: CommentService = CommentServiceImpl()
        var capturedError: LoadCommentsError?
        let expectation = self.expectation(description: "Capture valid error")
        // when
        sut.fetchComments(postId: postId) { result in
            switch result {
            case .success(let comments):
                print(comments)
            case .failure(let error):
                capturedError = error
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
        
        // then
        XCTAssertNotNil(capturedError)
        XCTAssertEqual(LoadCommentsError.invalidPostId, capturedError!)
    }
    
    func test_fetchComments_givenValidPostId_shouldReturnValidComments() {
        // given
        let postId = 1
        let sut: CommentService = CommentServiceImpl()
        var capturedComments: [Comment] = []
        let expectation = self.expectation(description: "Capture comments")
        // when
        sut.fetchComments(postId: postId) { result in
            switch result {
            case .success(let comments):
                capturedComments = comments
            case .failure(let error):
                print(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
        
        // then
        XCTAssertNotNil(capturedComments)
    }
    
    
    
}