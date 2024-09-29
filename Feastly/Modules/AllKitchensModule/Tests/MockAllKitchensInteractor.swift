//
//  MockAllKitchensInteractor.swift
//  AllKitchensModuleTests
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
@testable import AllKitchensModule

enum MockError: Error {
    case mockError
}

class MockAllKitchensInteractor : PresenterToInteractorAllKitchensProtocol {
    let kitchens : [Kitchen] = [
        .init(id: "TestId", name: "TestName", imageUrl: "TestImageUrl")
    ]
    var mockFetchKitchesReturnError = false
    var presenter:InteractorToPresenterAllKitchensProtocol?
    func fetchKitches() async throws {
        
        if mockFetchKitchesReturnError {
            throw MockError.mockError
        }else{
            presenter?.sendKitchenData(kitchens: kitchens)
        }
    }
    
    
}
