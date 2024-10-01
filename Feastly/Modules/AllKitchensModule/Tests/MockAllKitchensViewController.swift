//
//  MockAllKitchensViewController.swift
//  AllKitchensModuleTests
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import UIKit
@testable import AllKitchensModule

class MockAllKitchensViewController : PresenterToViewAllKitchensProtocol {
    
    
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
    
    var invokedListKitchenIsEnabled:Bool = false
    var invokedListKitchenIsEnabledCount:Int = 0
    var invokedListKitchenIsEnabledData = [(isEnabled: Bool, backColor: String)]()
    func listKitchenIsEnables(isEnabled: Bool, backColor: String) {
        invokedListKitchenIsEnabled = true
        invokedListKitchenIsEnabledCount += 1
        invokedListKitchenIsEnabledData.append((isEnabled: isEnabled, backColor: backColor))
    }
    
    var invokedClearButtonHidden:Bool = false
    var invokedClearButtonHiddenCount:Int = 0
    var invokedClearButtonHiddenData = [(isHidden: Bool,Void)]()
    func clearButtonHidden(isHidden: Bool) {
        invokedClearButtonHidden = true
        invokedClearButtonHiddenCount += 1
        invokedClearButtonHiddenData.removeAll()
        invokedClearButtonHiddenData.append((isHidden: isHidden,()))
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
    
    
    var invokedsetBackColorAble:Bool = false
    var invokedsetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
        invokedsetBackColorAble = true
        invokedsetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color:color,()))
    }
    
    
    var invokedPushViewController:Bool = false
    var invokedPushViewControllerData:Int = 0
    func pushViewControllerAble(_ vc: UIViewController, animated: Bool) {
         invokedPushViewController = true
         invokedPushViewControllerData += 1
    }

    var invokedpopViewControllerAble:Bool = false
    var invokedpopViewControllerAbleCount:Int = 0
    func popViewControllerAble() {
        invokedpopViewControllerAble = true
        invokedpopViewControllerAbleCount += 1
    }
    
}
