//
//  MockFilterRestaurantListViewController.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import UIKit
@testable import FilterRestaurnatListModule

class MockFilterRestaurantListViewController : PresenterToViewFilterRestaurantListProtocol {
    
    
    
    var invokedrestaurantCollectionViewPrepare:Bool = false
    var invokedrestaurantCollectionViewPrepareCount:Int = 0
    func restaurantCollectionViewPrepare() {
        invokedrestaurantCollectionViewPrepare = true
        invokedrestaurantCollectionViewPrepareCount += 1
    }
    
    var invokedrestaurantCollectionViewReload:Bool = false
    var invokedrestaurantCollectionViewReloadCount:Int = 0
    func restaurantCollectionViewReload() {
        invokedrestaurantCollectionViewReload = true
        invokedrestaurantCollectionViewReloadCount += 1
    }
    
    
    var invokedSetTitles:Bool = false
    var invokedSetTitlesCount:Int = 0
    var invokedSetTitlesData = [(filterRestaurantTitle:String,Void)]()
    func setTitles(filterRestaurantTitle: String) {
        invokedSetTitles = true
        invokedSetTitlesCount += 1
        invokedSetTitlesData.append((filterRestaurantTitle:filterRestaurantTitle,()))
    }
    
    var invokedStartActiviyIndicator:Bool = false
    var invokedStartActiviyIndicatorCount:Int = 0
    func startActivityIndicator() {
        invokedStartActiviyIndicator = true
        invokedStartActiviyIndicatorCount += 1
    }
    
    var invokedStopActivityIndicator:Bool = false
    var invokedStopActivityIndicatorCount:Int = 0
    func stopActivityIndicator() {
        invokedStopActivityIndicator = true
        invokedStopActivityIndicatorCount += 1
    }
    
    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    var involedCreateAlertMessage: Bool = false
    var involedCreateAlertMessageCount: Int = 0
    var involedCreateAlertMessageData = [(title: String, message: String, actionTitle: String)]()
    func createAlertMesssage(title: String, message: String, actionTitle: String) {
        involedCreateAlertMessage = false
        involedCreateAlertMessageCount += 1
        involedCreateAlertMessageData.append((title: title, message: message, actionTitle: actionTitle))
    }
    
    
    
    var invokedsetChangeTitle:Bool = false
    var invokedsetChangeTitleCount:Int = 0
    var invokedsetChangeTitleData = [(title:String,Void)]()
    func changeTitle(title: String) {
        invokedsetChangeTitle = true
        invokedsetChangeTitleCount += 1
        invokedsetChangeTitleData.append((title:title,()))
    }
    
    var invokedPushViewController:Bool = false
    var invokedPushViewControllerData:Int = 0
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
         invokedPushViewController = true
         invokedPushViewControllerData += 1
    }

    var invokedpopViewControllerAble:Bool = false
    var invokedpopViewControllerAbleData:Int = 0
    func popViewControllerAble() {
         invokedpopViewControllerAble = true
         invokedpopViewControllerAbleData += 1
    }
    
    
    
}
