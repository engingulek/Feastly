//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation

final class HomePresenter {
    weak var view : PresenterToViewHomeProtocol?
    init(view: PresenterToViewHomeProtocol) {
        self.view = view
    }
}


//MARK: ViewToPresenterHomeProtocol
extension HomePresenter : ViewToPresenterHomeProtocol {
    func viewDidLoad() {
        view?.kitchenCollectionViewPrepare()
        view?.kitchenCollectionViewReload()
        
        view?.offerCollectionViewPrepare()
        view?.offerCollectionViewReload()
    }
    
    
}


//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter:InteractorToPresenterHomeProtocol {
    func sendKitchenData() {
        
    }
    
    func sendOfferData() {
        
    }
    
    
}
