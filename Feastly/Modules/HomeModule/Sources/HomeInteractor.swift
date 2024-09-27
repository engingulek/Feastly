//
//  HomeInteractor.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation

class HomeInteractor : PresenterToInteractorHomeProtocol {
    var presenter : InteractorToPresenterHomeProtocol?
    func fetchKitches() async throws {
        presenter?.sendKitchenData()
    }
    
    func fetchOffer() async throws {
        presenter?.sendOfferData()
    }
    
    
}
