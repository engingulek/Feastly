//
//  RestaurantDetail.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 1.10.2024.
//

import Foundation

struct RestaurantDetail :Decodable {
    let menus:[Menu]
}

struct Menu : Decodable{
    let id:String
    let imageUrl:String
    let name:String
    let description:String
    let price:Double
}
