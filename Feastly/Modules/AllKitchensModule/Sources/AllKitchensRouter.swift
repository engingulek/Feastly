//
//  AllKitchensRouter.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import UIKit
import AllKitchensModuleProtocol
import FilterRestaurnatListModuleProtocol
import DependencyKit
public class AllKitchensRouter : AllKitchensModuleProtocol {

    public init() { }
    
    public func createAllKitchensViewController() -> UIViewController {
        let view = AllKitchensViewController()
        let interactor = AllKitchensInteractor()
        let router = AllKitchensRouter()
        let presenter : ViewToPresenterAllKitchensProtocol
        &
        InteractorToPresenterAllKitchensProtocol = AllKitchensPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}

extension AllKitchensRouter : PresenterToRouterAllKitchensProtocol {
    func toFilterProductList(view: PresenterToViewAllKitchensProtocol?,selectedKitchensId:[String]) {
        @Dependency var filterRestaurantListModuleProtocol : FilterRestaurnatListModuleProtocol
        let viewController = filterRestaurantListModuleProtocol.createFilterRestaurantListController(selectedList: selectedKitchensId)
        view?.pushViewControllerAble(viewController, animated: true)
        
    }
    
    
}
