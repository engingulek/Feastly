//
//  NetworkPath.swift
//  NetworkKit
//
//  Created by Engin Gülek on 28.09.2024.
//

import Foundation
import Alamofire
public enum NetworkPath{
    case kitchen
    case restaurant
    case filterByKitchen(Parameters)
    case restaurantDetail(String)
}



extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .kitchen:
            return Constants.kitchen.rawValue + Constants.getAll.rawValue
        case .restaurant:
            return Constants.restaurant.rawValue + Constants.getAll.rawValue
        case .filterByKitchen:
            return Constants.restaurant.rawValue + Constants.filterByKitchen.rawValue
        case .restaurantDetail(let id):
            return Constants.restaurant.rawValue + Constants.detail.rawValue + "?id=\(id)"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        case .filterByKitchen:
            return .POST
        default:
            return .GET
            
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .filterByKitchen(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        default:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
