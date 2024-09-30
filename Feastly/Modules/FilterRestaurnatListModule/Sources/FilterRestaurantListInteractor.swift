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
    func fetchRestaurantFilter() async throws {
        do{
            let response = try await networkManager.fetch(target: .restaurant, responseClass: DataResult<[Restaurant]>.self)
            presenter?.sendRestaurantData(restaurants: response.data)
        }catch{
            throw error
        }
    }
}
