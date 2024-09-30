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
}

protocol PresenterToViewRestaurantDetailProtocol: AnyObject,Kits{
    
}

protocol PresenterToInteractorRestaurantDetailProtocol{
    func fetchRestaurantDetail(id:String) async throws
}

protocol InteracorToPresenterRestaurantDetailProtocol {
    func sendRestaurantDetail()
}

protocol PresenterToRouterRestaurantDetailProtocol{
    
}
