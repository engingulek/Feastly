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
        do{
            let response = try await networkManager.fetch(target: .restaurantDetail(id), responseClass: DataResult<RestaurantDetail>.self)
            
            presenter?.sendRestaurantDetail(restaurantDetail: response.data)
        }catch{
            print("interactor \(error.localizedDescription)")
            throw error
        }
    }
    
    
}
