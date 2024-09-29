//
//  AllKitchensPresenter.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import CommonKit

final class AllKitchensPresenter {
    weak var view : PresenterToViewAllKitchensProtocol?
    private let interactor : PresenterToInteractorAllKitchensProtocol
    private let router : PresenterToRouterAllKitchensProtocol
    private var kitchenList:[Kitchen] = []
    private var selectedkitchenList:[String] = []
    
    init(view: PresenterToViewAllKitchensProtocol,
         interactor: PresenterToInteractorAllKitchensProtocol,
         router: PresenterToRouterAllKitchensProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
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
    
    private func listRestaurantEnabledAction(){
        selectedkitchenList.isEmpty ?
        view?.listKitchenIsEnables(isEnabled: false, backColor: ColorTheme.enabledOrange.rawValue) :
        view?.listKitchenIsEnables(isEnabled: true, backColor: ColorTheme.secondaryLabelColor.rawValue)
    }
    
    private func clearButtonIsHiddenAction(){
        selectedkitchenList.isEmpty ?  
        view?.clearButtonHidden(isHidden: true) :
        view?.clearButtonHidden(isHidden: false)
        
    }
    
    
}


//MARK: ViewToPresenterAllKitchensProtocol
extension AllKitchensPresenter : ViewToPresenterAllKitchensProtocol {

    func viewDidLoad() {
        view?.kitchenCollectionViewReload()
        view?.kitchenCollectionViewPrepare()
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.changeTitle(title: TextTheme.allKitchens.rawValue)
        view?.listKitchenIsEnables(isEnabled: false, backColor: ColorTheme.enabledOrange.rawValue)
        view?.clearButtonHidden(isHidden: true)
        
        Task{
            await fetchKithen()
        }
    }
    
    func numberOfItemsIn() -> Int {
        return kitchenList.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (kitchen: Kitchen,
                                                  backColor:String,
                                                  cellBorderColor:String,
                                                  cornerRadius:CGFloat) {
        print(kitchenList)

        let kitchen = kitchenList[indexPath.item]
                let stateKitchen = selectedkitchenList.contains(kitchen.id)
        let cellBorderColor = stateKitchen ? ColorTheme.secondaryLabelColor.rawValue : ColorTheme.primaryBackColor.rawValue
        return (kitchen,
                backColor:ColorTheme.secondaryBackColor.rawValue,cellBorderColor,
                cornerRadius:10)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
        let kitchen = kitchenList[indexPath.item]
      
        if let index = selectedkitchenList.firstIndex(of: kitchen.id) {
            selectedkitchenList.remove(at: index)
        
        } else {
            selectedkitchenList.append(kitchen.id)
        }
    
        
        listRestaurantEnabledAction()
        clearButtonIsHiddenAction()
        
        view?.kitchenCollectionViewReload()
        
        
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        let cellWidth = width / 4
        
        return CGSize(width: cellWidth - 10, height: cellWidth * 1.2)
    }
    
    func clearAllList() {
        selectedkitchenList.removeAll()
        view?.kitchenCollectionViewReload()
        view?.listKitchenIsEnables(isEnabled: false,backColor: ColorTheme.enabledOrange.rawValue)
    }
    
    
}

//MARK: InteractorToPresenterAllKitchensProtocol
extension AllKitchensPresenter : InteractorToPresenterAllKitchensProtocol {
    func sendKitchenData(kitchens: [Kitchen]) {
        kitchenList = kitchens
        view?.kitchenCollectionViewReload()
        view?.clearButtonHidden(isHidden: true)
    }
    
    
}
