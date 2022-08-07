//
//  AvriocAssessmentTests.swift
//  AvriocAssessmentTests
//
//  Created by macbook on 06/08/2022.
//

import XCTest
@testable import Assessment


final class HomeVMMock: Mockable, HomeServiceable {
    func getHomeList(for period: Int, completionHandler: @escaping (Result<NYTimesBaseModel, NYTimesReqError>)->()) {
        completionHandler(.success(loadJSON(filename: "homeList", type: NYTimesBaseModel.self)))
    }
}

final class HomeServiceMock: Mockable, HomeServiceable {
    func getHomeList(for period: Int, completionHandler: @escaping (Result<NYTimesBaseModel, NYTimesReqError>)->()) {
        completionHandler(.failure(.unexpectedStatusCode))
    }
}


class AvriocAssessmentTests: XCTestCase {
    
    func testHomeVMFetchData() throws {
        let viewModel = HomeVM(homeService: HomeVMMock())
        
        let expectation = expectation(description: "Fetch data from service")
        
        expectation.fulfill()
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
        XCTAssertEqual((viewModel.dataSource?.results?.count ?? -1), 20)
        XCTAssertEqual((viewModel.dataSource?.results?.first?.byline ?? ""), "By New York Times Games")
    }
    
    func testHomeServiceMock() async {
        let serviceMock = HomeServiceMock()
        serviceMock.getHomeList(for: 1) { result in
            switch result {
            case .success(let model):
                XCTAssertNotNil(model)
            case .failure(let error):
                XCTAssertEqual(error.customMessage,  "Go unexpected status code")
            }
        }
    }
}
