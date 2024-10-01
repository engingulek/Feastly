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
        return view
    }
}

extension RestaurantDetailRouter : PresenterToRouterRestaurantDetailProtocol {
    
}

