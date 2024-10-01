//
//  RestaurantDetailProtocols.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import CommonKit

typealias Kits = UIViewAble & AlertMessageAble & SegueAble & NavConUIAble

protocol ViewToPresenterRestaurantDetailProtocol{
    var view:PresenterToViewRestaurantDetailProtocol? {get}
    func viewDidLoad()
    func getRestaurantId(id:String)
    
    func numberOfItemsInSection() -> Int
    func cellForItem(at indexPath:IndexPath) -> (menu:Menu,
                                                 backColor:String,
                                                 cornerRadius:CGFloat)
    
    func sizeForItemAt(width:CGFloat,height:CGFloat) -> CGSize
}

protocol PresenterToViewRestaurantDetailProtocol: AnyObject,Kits{
    func restaurantMenusCollectionViewPrepare()
    func restaurantMenusCollectionViewRealoadData()
    func setTitle(menuText:String)
    func setDetailView(detail:RestaurantDetail)
}

protocol PresenterToInteractorRestaurantDetailProtocol{
    func fetchRestaurantDetail(id:String) async throws
}

protocol InteracorToPresenterRestaurantDetailProtocol {
    func sendRestaurantDetail(restaurantDetail:RestaurantDetail?)
    
}

protocol PresenterToRouterRestaurantDetailProtocol{
    
}
