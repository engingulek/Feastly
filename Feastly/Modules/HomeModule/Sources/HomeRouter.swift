//
//  HomeRouter.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit
import HomeModuleProtocol
import AllKitchensModuleProtocol
import DependencyKit
public class HomeRouter : HomeModuleProtocol {
    public init() { }
    public func createHomeViewController() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter : ViewToPresenterHomeProtocol
        & InteractorToPresenterHomeProtocol = HomePresenter(view: view,interactor: interactor,router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}

extension HomeRouter : PresenterToRouterHomeProtocol {
    func toAllKitchens(view:PresenterToViewHomeProtocol?) {
        @Dependency var allKitchesProtocol : AllKitchensModuleProtocol
        let viewController = allKitchesProtocol.createAllKitchensViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
}



