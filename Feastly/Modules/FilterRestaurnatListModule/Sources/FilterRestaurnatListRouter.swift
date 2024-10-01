//
//  FilterRestaurnatListRouter.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import FilterRestaurnatListModuleProtocol
import UIKit
import DependencyKit
import RestaurantDetailModuleProtocol
public class FilterRestaurnatListRouter : FilterRestaurnatListModuleProtocol {
    public init() { }
    public func createFilterRestaurantListController(selectedList:[String]) -> UIViewController {
        let view = FilterRestaurantListViewController()
        let interactor = FilterRestaurantListInteractor()
        let router = FilterRestaurnatListRouter()
        let presenter : ViewToPresenterFilterRestaurantListProtocol
        &
        InteractorToPresenterFilterRestaurantListProtocol
        = FilterRestaurnatListPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.getSelectedList(list: selectedList)
        return view
    }
}



extension FilterRestaurnatListRouter : PresenterToRouterFilterRestaurantListProtocol {
    func toRestaurantDetail(view: PresenterToViewFilterRestaurantListProtocol?, id: String) {
        @Dependency var restaurantDetailModuleProtocol : RestaurantDetailModuleProtocol
        let viewController = restaurantDetailModuleProtocol.createRestaurantDetailViewController(restaurantId: id)
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
