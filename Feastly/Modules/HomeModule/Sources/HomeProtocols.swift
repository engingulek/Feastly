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
    func changeOfferArrayDesign()
    
    func numberOfItemsIn(tag:Int) -> Int
    func cellForItem(at indexPath:IndexPath,tag:Int) -> (state:Bool,
                                                         backColor:String,
                                                         cornerRadius:CGFloat)
    func sizeForItemAt(tag:Int,width:CGFloat,height:CGFloat) -> CGSize
    
    func cellItemForKitchen(at indexPath:IndexPath) -> Kitchen
}

protocol PresenterToViewHomeProtocol:AnyObject,Kits{
    func kitchenCollectionViewReload()
    func kitchenCollectionViewPrepare()
    
    func offerCollectionViewReload()
    func offerCollectionViewPrepare()
    
    func setTitles(kitchenText:String,offerText:String)
    func setChangeArrayButtonType(image:String,text:String)
}


protocol PresenterToInteractorHomeProtocol {
    func fetchKitches() async throws
    func fetchOffer() async throws
}


protocol InteractorToPresenterHomeProtocol{
    func sendKitchenData(kitchens:[Kitchen])
    func sendOfferData()
}

protocol PresenterToRouterHomeProtocol {
    
}
