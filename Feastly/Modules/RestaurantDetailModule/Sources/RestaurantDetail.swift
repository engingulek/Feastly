//
//  RestaurantDetail.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 1.10.2024.
//

import Foundation
import CommonKit
struct RestaurantDetail :Decodable {
    let id, name: String
    let kitchens: [KitchenResponse]
    let imageURL: String
    let latitude, longitude: Double
    let minWage: Int
    let service:Int
    let flavor:Int
    let menus: [Menu]

    enum CodingKeys: String, CodingKey {
        case id, name, kitchens
        case imageURL = "imageUrl"
        case latitude, longitude, minWage, menus
        case service,flavor
    }
   
}


// MARK: - Menu
struct Menu: Decodable {
    let id: String
    let imageURL: String
    let name: String
    let description: String?
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case name, description, price
    }
}
