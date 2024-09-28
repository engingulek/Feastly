//
//  MockHomeInteractor.swift
//  HomeModuleTests
//
//  Created by Engin Gülek on 28.09.2024.
//

import Foundation
@testable import HomeModule

enum MockError: Error {
    case mockError
}

class MockHomeInteractor : PresenterToInteractorHomeProtocol {
    let kitchens : [Kitchen] = []
    let offer:[String]  = []
    var mockFetchKitchesReturnError = false
    var presenter : InteractorToPresenterHomeProtocol!
    
    func fetchKitches() async throws {
        if mockFetchKitchesReturnError {
            throw MockError.mockError
        }
    }
    
    func fetchOffer() async throws {
        
    }
    
    
}
