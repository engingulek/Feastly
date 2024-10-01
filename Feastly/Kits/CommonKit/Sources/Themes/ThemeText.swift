//
//  ThemeText.swift
//  CommonKit
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation

public enum TextTheme:String {
    case none = ""
    case kitchen = "Kitchen"
    case restaurants = "Restaurants"
    case view = "View"
    /// is Error
    case primaryErrorTitle = "Error"
    /// is Ok
    case primaryErrorActionTitle = "Ok"
    /// is Something went wrong
    case primaryErrorMessage = "Something went wrong"
    
    case allKitchens = "All Kitchens"
    
    case homePageTitle = "Home Page"
    
    case listRestaurants = "List restaurants"
    
    case clear = "Clear"
    
    case filteredRestaurants = "Filtered Testaurants"
    
    case menus = "Menus"
    
    case service = "Service: "
    
    case flavor = "Flavor: "
    
    case minWage = "Min Wage"
    
    case restaurantDetail = "Restaurant Detail"
}

