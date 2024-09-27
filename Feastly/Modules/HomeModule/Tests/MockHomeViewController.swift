//
//  MockHomeViewController.swift
//  HomeModuleTests
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
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
    
    var invokedofferCollectionViewReload:Bool = false
    var invokedofferCollectionViewReloadCount:Int = 0
    func offerCollectionViewReload() {
        invokedofferCollectionViewReload = true
        invokedofferCollectionViewReloadCount += 1
    }
    
    var invokedofferCollectionViewPrepare:Bool = false
    var invokedOfferCollectionViewPrepareCount:Int = 0
    func offerCollectionViewPrepare() {
        invokedofferCollectionViewPrepare = true
        invokedOfferCollectionViewPrepareCount += 1
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
    
    var involedsetChangeArrayButtonType:Bool = false
    var involedsetChangeArrayButtonTypeCount:Int = 0
    var involedsetChangeArrayButtonTypeData =  [(image:String,text:String)]()
    func setChangeArrayButtonType(image: String, text: String) {
         involedsetChangeArrayButtonType = true
         involedsetChangeArrayButtonTypeCount += 1
        
        involedsetChangeArrayButtonTypeData.append((image:image,text:text))
    }
    
    
    
    
    
}
