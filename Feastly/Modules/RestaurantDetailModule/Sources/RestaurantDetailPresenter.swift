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
            view?.createAlertMesssage(title: TextTheme.primaryErrorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryErrorActionTitle.rawValue)
        }
    }
}


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
}

extension RestaurantDetailPresenter : InteracorToPresenterRestaurantDetailProtocol {
    func sendRestaurantDetail(restaurantDetail: RestaurantDetail) {
      
        menus = restaurantDetail.menus
        view?.setDetailView(detail: restaurantDetail)
        view?.restaurantMenusCollectionViewRealoadData()
    }
}
