//
//  HomeProtocols.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import CommonKit

typealias Kits = UIViewAble & AlertMessageAble & SegueAble & NavConUIAble

protocol ViewToPresenterHomeProtocol{
    var view : PresenterToViewHomeProtocol? {get}
    func viewDidLoad()
    func searchAction(text:String?)
    func changeOfferArrayDesign()
    func didTappedAllKitchensButton()
    
    func numberOfItemsIn(tag:Int) -> Int
    func cellForItem(at indexPath:IndexPath,tag:Int) -> (state:Bool,
                                                         backColor:String,
                                                         cornerRadius:CGFloat)
    func didSelecetItem(at indexPath:IndexPath,tag:Int)
    func sizeForItemAt(tag:Int,width:CGFloat,height:CGFloat) -> CGSize
    
    func cellItemForKitchen(at indexPath:IndexPath) -> Kitchen
    func cellItemForRestaurant(at indexPath:IndexPath) -> RestaurantResponse
    
}

protocol PresenterToViewHomeProtocol:AnyObject,Kits{
    func kitchenCollectionViewReload()
    func kitchenCollectionViewPrepare()
    
    func restaurantCollectionViewPrepare()
    func restaurantCollectionViewReload()
    
    func setTitles(kitchenText:String,offerText:String)
    func setChangeArrayButtonType(image:String,text:String)
}


protocol PresenterToInteractorHomeProtocol {
    func fetchKitches() async throws
    func fetchRestaurant() async throws
}


protocol InteractorToPresenterHomeProtocol{
    func sendKitchenData(kitchens:[Kitchen])
    func sendRestaurantData(restaurant:[Restaurant])
}

protocol PresenterToRouterHomeProtocol {
    func toAllKitchens(view:PresenterToViewHomeProtocol?)
    func toFilterRestaurantList(view:PresenterToViewHomeProtocol?,kitchenId:String)
}
