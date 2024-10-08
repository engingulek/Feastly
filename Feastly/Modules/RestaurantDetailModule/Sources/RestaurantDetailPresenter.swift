//
//  RestaurantDetailPresenter.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 1.10.2024.
//

import Foundation
import CommonKit

final class RestaurantDetailPresenter {
    weak var view : PresenterToViewRestaurantDetailProtocol?
    private var interactor: PresenterToInteractorRestaurantDetailProtocol
    private var  router : PresenterToRouterRestaurantDetailProtocol
    private var menus : [Menu] = []

    
    init(view: PresenterToViewRestaurantDetailProtocol , 
         interactor: PresenterToInteractorRestaurantDetailProtocol,
         router: PresenterToRouterRestaurantDetailProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    private func fetchRestaurantDetail(id:String) async {
        do{
            try await interactor.fetchRestaurantDetail(id: id)
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                createAlertMessage()
            }
        }
    }
    
  
    private func createAlertMessage(){
        view?.createAlertMesssage(title: TextTheme.primaryErrorTitle.rawValue,
                                  message: TextTheme.primaryErrorMessage.rawValue,
                                  actionTitle: TextTheme.primaryErrorActionTitle.rawValue)
    }
}

//MARK: ViewToPresenterRestaurantDetailProtocol
extension RestaurantDetailPresenter : ViewToPresenterRestaurantDetailProtocol {
  
    
    
    func viewDidLoad() {
        view?.restaurantMenusCollectionViewPrepare()
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.setTitle(menuText: TextTheme.menus.rawValue)
        view?.changeTitle(title: TextTheme.restaurantDetail.rawValue)
        view?.viewLabelsTest(service: TextTheme.service.rawValue,
                             flavor: TextTheme.flavor.rawValue,
                             minWage: TextTheme.minWage.rawValue)
    }
    
    func getRestaurantId(id: String) {
        Task{
            await fetchRestaurantDetail(id:id)
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return menus.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (menu: Menu, backColor: String, cornerRadius: CGFloat) {
      
        let menu = menus[indexPath.item]
        return (menu:menu,backColor:ColorTheme.secondaryBackColor.rawValue,cornerRadius:10)
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return CGSize(width: width - 10 , height: height / 7)
    }
    
    func minimumLineSpacingForSectionAt() -> CGFloat {
        return 10
    }
    
    func insetForSectionAt() -> (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        return (top: 0, left: 10, right: 0, bottom: 10)
    }
    
}

//MARK: InteracorToPresenterRestaurantDetailProtocol
extension RestaurantDetailPresenter : InteracorToPresenterRestaurantDetailProtocol {
    func sendRestaurantDetail(restaurantDetail: RestaurantDetail) {
      
        menus = restaurantDetail.menus
        view?.setDetailView(detail: restaurantDetail)
        view?.restaurantMenusCollectionViewRealoadData()
    }
}
