//
//  RazeNetworkingTests.swift
//  RazeCoreTests
//
//  Created by umam on 6/16/20.
//

import XCTest
@testable import RazeCore

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}

final class RazeNetworkingTests: XCTestCase {
    func testLoadDataCall() {
        let manager = RazeCore.Networking.Manager()
        let session = NetworkSessionMock()
        
        let data = Data([0,1])
        session.data = data
        
        manager.session = session
        let url = URL(fileURLWithPath: "url")
        
        let expectation = XCTestExpectation(description: "called for data")
        
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            
            switch result {
            case .success(let returnData):
                    XCTAssertNotNil(returnData, "response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        
        wait(for: [expectation], timeout: 5)
        
    }

    static var allTests = [
        ("test load data", testLoadDataCall)
    ]
}
