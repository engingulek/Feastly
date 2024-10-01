//
//  AllKitchensInteractor.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import NetworkKit
import CommonKit
class AllKitchensInteractor : PresenterToInteractorAllKitchensProtocol {
    
    var presenter : InteractorToPresenterAllKitchensProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    
    func fetchKitches() async throws {
        do{
            let response = try await networkManager.fetch(target: .kitchen, responseClass: DataResult<[Kitchen]>.self)
            presenter?.sendKitchenData(kitchens:response.data)
        }catch{
            throw error
        }
    }
    
    
}
