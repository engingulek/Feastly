//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import CommonKit
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
        
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.setTitles(kitchenText: TitleTheme.kitchen.rawValue,
                        offerText: TitleTheme.offer.rawValue)
    }
    
    func searchAction(text: String?) {
        print(text)
    }
    
    
}


//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter:InteractorToPresenterHomeProtocol {
    func sendKitchenData() {
        
    }
    
    func sendOfferData() {
        
    }
    
    
}
