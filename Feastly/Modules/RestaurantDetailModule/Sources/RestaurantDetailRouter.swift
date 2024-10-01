//
//  RestaurantDetailRouter.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import RestaurantDetailModuleProtocol
import UIKit

public class RestaurantDetailRouter : RestaurantDetailModuleProtocol {
    public init() { }
    public func createRestaurantDetailViewController(restaurantId:String) -> UIViewController {
        let view = RestaurantDetailViewController()
        let intractor = RestaurantDetailInteractor()
        let router = RestaurantDetailRouter()
        let presenter : ViewToPresenterRestaurantDetailProtocol & InteracorToPresenterRestaurantDetailProtocol = RestaurantDetailPresenter(view: view, interactor: intractor, router: router)
        view.presenter = presenter
        intractor.presenter = presenter
        presenter.getRestaurantId(id: restaurantId)
        return view
    }
}

extension RestaurantDetailRouter : PresenterToRouterRestaurantDetailProtocol {
    
}

