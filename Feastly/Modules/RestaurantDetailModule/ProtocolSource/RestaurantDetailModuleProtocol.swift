//
//  RestaurantDetailModuleProtocol.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import UIKit

public protocol RestaurantDetailModuleProtocol {
    func createRestaurantDetailViewController(restaurantId:String) -> UIViewController
}
