//
//  Restaurant.swift
//  HomeModule
//
//  Created by Engin Gülek on 28.09.2024.
//

import Foundation

struct Restaurant : Decodable {
    let id, name: String
    let kitchens: [KitchenResponse]
    let imageURL: String
    let latitude, longitude: Double
    let minWage: Int

    enum CodingKeys: String, CodingKey {
        case id, name, kitchens
        case imageURL = "imageUrl"
        case latitude, longitude, minWage
    }
}


struct KitchenResponse: Decodable {
    let id, name: String
}
