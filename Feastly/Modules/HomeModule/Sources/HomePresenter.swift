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
    private let interactor :  PresenterToInteractorHomeProtocol
    private var offerArrayDesignState : Bool = false
    private var kitchenList:[Kitchen] = []
    init(view: PresenterToViewHomeProtocol,interactor:PresenterToInteractorHomeProtocol) {
        self.view = view
        self.interactor = interactor
    }
    private func fetchKithen() async {
        do{
            try await interactor.fetchKitches()
        }catch{
            view?.createAlertMesssage(title: TextTheme.primaryErrorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue, 
                                      actionTitle: TextTheme.primaryErrorActionTitle.rawValue)
        }
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
        view?.setTitles(kitchenText: TextTheme.kitchen.rawValue,
                        offerText: TextTheme.offer.rawValue)
        
        view?.setChangeArrayButtonType(image: "lineweight", text: TextTheme.view.rawValue)
        
        Task{
            await fetchKithen()
        }
    }
    
    func searchAction(text: String?) {
        print(text)
    }
    
    func changeOfferArrayDesign() {
        offerArrayDesignState.toggle()
        let text =  TextTheme.view.rawValue
        let image = offerArrayDesignState ?  "list.dash" : "lineweight"
        view?.setChangeArrayButtonType(image: image, text: text)
        view?.offerCollectionViewReload()
    }
    
    func cellItemForKitchen(at indexPath: IndexPath) -> Kitchen {
        let kitchen = kitchenList[indexPath.item]
        return kitchen
    }

}

//MARK: ViewToPresenterHomeProtocol + UICollectionViewDelegate,UICollectionViewDataSource
extension HomePresenter {
    
    
    func numberOfItemsIn(tag: Int) -> Int {
        switch tag {
        case 0:
            return kitchenList.count
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
            
            return CGSize(width: cellWidth - 10, height: cellWidth * 1.2)
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
    func sendKitchenData(kitchens: [Kitchen]) {
        kitchenList = kitchens
        view?.kitchenCollectionViewReload()
    }
    

    
    func sendOfferData() {
        
    }
    
    
}
