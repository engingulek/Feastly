//
//  Kitchen.swift
//  CommonKit
//
//  Created by Engin Gülek on 1.10.2024.
//

import Foundation

public struct Kitchen : Decodable {
   public init(id: String, name: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
    public  let id:String
    public  let name:String
    public  let imageUrl:String
}
