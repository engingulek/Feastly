//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import CommonKit

final class HomePresenter {
    weak var view : PresenterToViewHomeProtocol?
    private var offerArrayDesignState : Bool = false
    init(view: PresenterToViewHomeProtocol) {
        self.view = view
    }
}


//MARK: ViewToPresenterHomeProtocol
extension HomePresenter : ViewToPresenterHomeProtocol {
 
    
    func viewDidLoad() {
        
        view?.kitchenCollectionViewPrepare()
        view?.kitchenCollectionViewReload()
        
        view?.offerCollectionViewPrepare()
        view?.offerCollectionViewReload()
        
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.setTitles(kitchenText: TitleTheme.kitchen.rawValue,
                        offerText: TitleTheme.offer.rawValue)
        
        view?.setChangeArrayButtonType(image: "lineweight", text: "View")
    }
    
    func searchAction(text: String?) {
        print(text)
    }
    
    func changeOfferArrayDesign() {
        offerArrayDesignState.toggle()
        let text = "View"
        let image = offerArrayDesignState ?  "list.dash" : "lineweight"
        view?.setChangeArrayButtonType(image: image, text: text)
        view?.offerCollectionViewReload()
    }
    
}

//MARK: ViewToPresenterHomeProtocol + UICollectionViewDelegate,UICollectionViewDataSource
extension HomePresenter {
    
    
    func numberOfItemsIn(tag: Int) -> Int {
        switch tag {
        case 0:
            return 10
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func cellForItem(at indexPath: IndexPath,tag:Int) -> (state:Bool,
                                                          backColor:String,
                                                          cornerRadius:CGFloat) {
        switch tag {
            
        case 0:
            return (state:false,
                    backColor:ColorTheme.secondaryBackColor.rawValue,
                    cornerRadius:10)
        case 1:
            return (state:offerArrayDesignState,
                    backColor:ColorTheme.secondaryBackColor.rawValue,
                    cornerRadius:10)
        default:
              return (state:false,
                            backColor:ColorTheme.primaryBackColor.rawValue,
                            cornerRadius:0)
        }
    }
    
    
    func sizeForItemAt(tag: Int,width:CGFloat,height:CGFloat) -> CGSize {
        switch tag{
        case 0 :
            
            let cellWidth = width / 4
            
            return CGSize(width: cellWidth, height: cellWidth * 1.2)
        case 1:
          
            
            return offerArrayDesignState ? 
            CGSize(width: width - 10, height: height / 8)
            :
            CGSize(width: width - 10, height: height / 4)
        default:
           return CGSize(width: 0, height: 0)
        }
    }
}


//MARK: InteractorToPresenterHomeProtocol
extension HomePresenter:InteractorToPresenterHomeProtocol {
    func sendKitchenData() {
        
    }
    
    func sendOfferData() {
        
    }
    
    
}
