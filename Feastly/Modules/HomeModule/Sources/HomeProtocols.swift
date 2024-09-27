//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import CommonKit

typealias Kits = UIViewAble

protocol ViewToPresenterHomeProtocol {
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func searchAction(text:String?)
}

protocol PresenterToViewHomeProtocol:AnyObject,Kits{
    func kitchenCollectionViewReload()
    func kitchenCollectionViewPrepare()
    
    func offerCollectionViewReload()
    func offerCollectionViewPrepare()
    
    func setTitles(kitchenText:String,offerText:String)
}


protocol PresenterToInteractorHomeProtocol {
    func fetchKitches() async throws
    func fetchOffer() async throws
}


protocol InteractorToPresenterHomeProtocol{
    func sendKitchenData()
    func sendOfferData()
}

protocol PresenterToRouterHomeProtocol {
    
}
