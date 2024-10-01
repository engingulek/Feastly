//
//  AllKitchensProtocols.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import CommonKit


typealias Kits = UIViewAble & AlertMessageAble & SegueAble & NavConUIAble
protocol ViewToPresenterAllKitchensProtocol {
    var view : PresenterToViewAllKitchensProtocol? {get}
    func viewDidLoad()
    func clearAllList()
    func numberOfItemsIn() -> Int
    func cellForItem(at indexPath:IndexPath) -> (kitchen:Kitchen,
                                                 backColor:String,
                                                 cellBorderColor:String,
                                                 cornerRadius:CGFloat,
                                                 borderWidth:CGFloat)
    func insetForSectionAt() ->(top:CGFloat,left:CGFloat,right:CGFloat,bottom:CGFloat)
    func didSelectItem(at indexPath:IndexPath)
    func sizeForItemAt(width:CGFloat,height:CGFloat) -> CGSize
    func didTappedListRestaurantButton()
    
}



protocol PresenterToViewAllKitchensProtocol : AnyObject,Kits {
    func kitchenCollectionViewReload()
    func kitchenCollectionViewPrepare()
    func listKitchenIsEnables(isEnabled:Bool,backColor:String)
    func clearButtonHidden(isHidden:Bool)
}


protocol PresenterToInteractorAllKitchensProtocol  {
    func fetchKitches() async throws
}

protocol InteractorToPresenterAllKitchensProtocol{
    func sendKitchenData(kitchens:[Kitchen])
}

protocol PresenterToRouterAllKitchensProtocol{
    func toFilterProductList(view:PresenterToViewAllKitchensProtocol?,
                             selectedKitchensId:[String])
}
