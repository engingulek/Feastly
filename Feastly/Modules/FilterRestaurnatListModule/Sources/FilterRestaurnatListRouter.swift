//
//  FilterRestaurnatListRouter.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import FilterRestaurnatListModuleProtocol
import UIKit

public class FilterRestaurnatListRouter : FilterRestaurnatListModuleProtocol {
    public init() { }
    public func createFilterRestaurantListController(selectedList:[String]) -> UIViewController {
        let view = FilterRestaurantListViewController()
        return view
    }
}
