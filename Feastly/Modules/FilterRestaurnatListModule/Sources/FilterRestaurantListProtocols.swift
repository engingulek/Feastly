//
//  FilterRestaurantListProtocols.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import CommonKit

typealias Kits = UIViewAble & AlertMessageAble & SegueAble & NavConUIAble

protocol ViewToPresenterFilterRestaurantListProtocol {
    var view:PresenterToViewFilterRestaurantListProtocol?{get}
    func viewDidLoad()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath) -> (restaurant:RestaurantResponse,
                                                 backColor:String,
                                                 cornerRadius:CGFloat)
    func didSelectItem(at indePath:IndexPath)
    func sizeForItemAt(width:CGFloat,height:CGFloat) -> CGSize
    
    func getSelectedList(list:[String])
}

protocol PresenterToViewFilterRestaurantListProtocol:AnyObject,Kits{
    func restaurantCollectionViewPrepare()
    func restaurantCollectionViewReload()
    
    func setTitles(filterRestaurantTitle:String)
    
    func startActivityIndicator()
    func stopActivityIndicator()
}


protocol PresenterToInteractorFilterRestaurantListProtocol{
    func fetchRestaurantFilter(list:[String]) async throws
}

protocol InteractorToPresenterFilterRestaurantListProtocol{
    func sendRestaurantData(restaurants:[Restaurant])
}

protocol PresenterToRouterFilterRestaurantListProtocol{
    func toRestaurantDetail(view:PresenterToViewFilterRestaurantListProtocol?,id:String)
}
