//
//  HomeInteractor.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import NetworkKit
class HomeInteractor : PresenterToInteractorHomeProtocol {
    var presenter : InteractorToPresenterHomeProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func fetchKitches() async throws {
        do{
            let response = try await networkManager.fetch(target: .kitchen, responseClass: DataResult<[Kitchen]>.self)
            presenter?.sendKitchenData(kitchens:response.data)
        }catch{
            throw error
        }
        
    }
    
    func fetchOffer() async throws {
        presenter?.sendOfferData()
    }
    
    
}
