//
//  FilterRestaurantListInteractor.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import NetworkKit
class FilterRestaurantListInteractor : PresenterToInteractorFilterRestaurantListProtocol {
    var presenter : InteractorToPresenterFilterRestaurantListProtocol?
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    func fetchRestaurantFilter(list:[String]) async throws {
        let parameters = ["list":list]
        do{
            let response = try await networkManager.fetch(target: .filterByKitchen(parameters), responseClass: DataResult<[Restaurant]>.self)
            presenter?.sendRestaurantData(restaurants: response.data)
        }catch{
            throw error
        }
    }
}
