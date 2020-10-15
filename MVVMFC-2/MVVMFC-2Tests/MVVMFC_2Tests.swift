//
//  MVVMFC_2Tests.swift
//  MVVMFC-2Tests
//
//  Created by Lê Hoàng Sinh on 9/23/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import XCTest
@testable import MVVMFC_2

class MVVMFC_2Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMainViewModel() {
        let viewModel = MockupMainViewModel()
        
        let viewController = MainViewController(viewModel: viewModel)
        
        let _ = viewController.view
        
        //write test here
        // request data and count the number of item (count == 14 is true)
        
        
        let expect = expectation(description: "request data success")
        viewModel.getData(fileName: "item")
        expect.fulfill()
        wait(for: [expect], timeout: 3)
        
        
        let count = viewModel.items.count
        
        XCTAssert(count == 15)
        
        
    }
    
    func testGitHubViewModel() {
        let viewModel = MockupGitHubViewModel()
        
        let viewController = GitHubViewController(viewModel: viewModel)
        
        let _ = viewController.view
        
        //write test here
    }
    func testDetailViewModel() {
        let viewModel = MockupDetailViewModel()
        
        let viewController = DetailViewController(viewModel: viewModel)
        
        let _ = viewController.view
        
        //write test here
    }
    func testSongViewModel() {
        let viewModel = MockupSongViewModel()
        
        let viewController = SongViewController(viewModel: viewModel)
        
        let _ = viewController.view
        
        //write test here
    }
    
    

}
