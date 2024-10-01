//
//  RestaurantDetailInteractor.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 1.10.2024.
//

import Foundation
import NetworkKit
class RestaurantDetailInteractor : PresenterToInteractorRestaurantDetailProtocol {
    var presenter : InteracorToPresenterRestaurantDetailProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func fetchRestaurantDetail(id: String) async throws {
        
    }
    
    
}
