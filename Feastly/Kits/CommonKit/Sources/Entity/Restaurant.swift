//
//  Restaurant.swift
//  CommonKit
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation

 public struct Restaurant : Decodable {
     public  init(id: String, name: String, kitchens: [KitchenResponse], 
                  imageURL: String, latitude: Double, longitude: Double, minWage: Int) {
         self.id = id
         self.name = name
         self.kitchens = kitchens
         self.imageURL = imageURL
         self.latitude = latitude
         self.longitude = longitude
         self.minWage = minWage
     }
     public  let id, name: String
     public  let kitchens: [KitchenResponse]
     public  let imageURL: String
     public   let latitude, longitude: Double
     public   let minWage: Int

    enum CodingKeys: String, CodingKey {
        case id, name, kitchens
        case imageURL = "imageUrl"
        case latitude, longitude, minWage
    }
}


public struct KitchenResponse: Decodable {
    
    public let id, name: String
}
