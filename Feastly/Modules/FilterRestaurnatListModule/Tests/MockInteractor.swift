//
//  MockInteractor.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
@testable import FilterRestaurnatListModule


enum MockError: Error {
    case mockError
}

class MockInteractor : PresenterToInteractorFilterRestaurantListProtocol {
  
    let list:[Restaurant]  = []
    var mockFetchRestaurantError = false
    
    func fetchRestaurantFilter(list: [String]) async throws {
        if mockFetchRestaurantError {
            throw MockError.mockError
        }
    }
    
}
