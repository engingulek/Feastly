//
//  MockHomeViewController.swift
//  HomeModuleTests
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit
@testable import HomeModule


class MockHomeViewController : PresenterToViewHomeProtocol {


    var invokedkitchenCollectionViewReload:Bool = false
    var invokedkitchenCollectionViewReloadCount:Int = 0
    func kitchenCollectionViewReload() {
        invokedkitchenCollectionViewReload = true
        invokedkitchenCollectionViewReloadCount += 1
    }
    
    var invokedKitchenCollectionViewPrepare:Bool = false
    var invokedKitchenCollectionViewPrepareCount:Int = 0
    func kitchenCollectionViewPrepare() {
        invokedKitchenCollectionViewPrepare = true
        invokedKitchenCollectionViewPrepareCount += 1
    }
    
    

    
    
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
    var invokedSetTitlesData = [(kitchenText:String,offerText:String)]()
    func setTitles(kitchenText: String, offerText: String) {
        invokedSetTitles = true
        invokedSetTitlesCount += 1
        invokedSetTitlesData.append((kitchenText:kitchenText,offerText:offerText))
    }
    
    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    
    var invokedsetChangeTitle:Bool = false
    var invokedsetChangeTitleCount:Int = 0
    var invokedsetChangeTitleData = [(title:String,Void)]()
    func changeTitle(title: String) {
        invokedsetChangeTitle = true
        invokedsetChangeTitleCount += 1
        invokedsetChangeTitleData.append((title:title,()))
    }
    

    
    var involedsetChangeArrayButtonType:Bool = false
    var involedsetChangeArrayButtonTypeCount:Int = 0
    var involedsetChangeArrayButtonTypeData =  [(image:String,text:String)]()
    func setChangeArrayButtonType(image: String, text: String) {
         involedsetChangeArrayButtonType = true
         involedsetChangeArrayButtonTypeCount += 1
        involedsetChangeArrayButtonTypeData.append((image:image,text:text))
    }
    
    var involedCreateAlertMessage: Bool = false
    var involedCreateAlertMessageCount: Int = 0
    var involedCreateAlertMessageData = [(title: String, message: String, actionTitle: String)]()
    func createAlertMesssage(title: String, message: String, actionTitle: String) {
         involedCreateAlertMessage = false
         involedCreateAlertMessageCount += 1
        involedCreateAlertMessageData.append((title: title, message: message, actionTitle: actionTitle))
    }
    
    

    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {}

    
    
    
    
    
}
