//
//  RestaurantResponse.swift
//  CommonKit
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation

public struct RestaurantResponse {
    public init(id: String, imageURL: String, name: String, kitches: String, restaurantInfo: String) {
        self.id = id
        self.imageURL = imageURL
        self.name = name
        self.kitches = kitches
        self.restaurantInfo = restaurantInfo
    }
    public  let id:String
    public let imageURL:String
    public let name:String
    public  let kitches:String
    public let restaurantInfo:String
}
