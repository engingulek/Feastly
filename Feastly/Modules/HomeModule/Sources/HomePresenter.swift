//
//  HomePresenter.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import CommonKit
import CoreLocation
final class HomePresenter {
    weak var view : PresenterToViewHomeProtocol?
    private let interactor :  PresenterToInteractorHomeProtocol
    private let router : PresenterToRouterHomeProtocol
    private var restaurantArrayDesignState : Bool = false
    private var kitchenList:[Kitchen] = []
    private var restaurantLit:[Restaurant] = []
    
    private let locationManager = CLLocationManager()
    init(view: PresenterToViewHomeProtocol,interactor:PresenterToInteractorHomeProtocol,router:PresenterToRouterHomeProtocol) {
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
    
    
    private func fetchRestaurant() async {
        do{
            try await interactor.fetchRestaurant()
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
        
        view?.restaurantCollectionViewPrepare()
        view?.restaurantCollectionViewReload()
        
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        view?.setTitles(kitchenText: TextTheme.kitchen.rawValue,
                        offerText: TextTheme.restaurants.rawValue)
        
        view?.setChangeArrayButtonType(image: "lineweight", text: TextTheme.view.rawValue)

        
       
        Task{
            await fetchKithen()
            await fetchRestaurant()
        }
    }
    
    func searchAction(text: String?) {
        print(text)
    }
    
    
    func changeOfferArrayDesign() {
        restaurantArrayDesignState.toggle()
        let text =  TextTheme.view.rawValue
        let image = restaurantArrayDesignState ?  "list.dash" : "lineweight"
        view?.setChangeArrayButtonType(image: image, text: text)
        view?.restaurantCollectionViewReload()
    }
    
    func didTappedAllKitchensButton() {
        router.toAllKitchens()
    }
    

    
    func cellItemForKitchen(at indexPath: IndexPath) -> Kitchen {
        let kitchen = kitchenList[indexPath.item]
        return kitchen
    }
    
    func cellItemForRestaurant(at indexPath: IndexPath) -> RestaurantResponse {
        let restaurant = restaurantLit[indexPath.item]
        let kitches = restaurant.kitchens.map { $0.name }.joined(separator:", ")
        let restaurantLocation = CLLocation(latitude: restaurant.latitude, longitude: restaurant.longitude)
        //NOTE: Detafault Location was used because CLLocation gave error on simulator.
        let userLocation = CLLocation(latitude: 41.09732, longitude: 29.03126)
        let km = restaurantLocation.distance(from: userLocation) / 1000
        let time = km / 25
        let restaurantInfo = " * \(String(format: "%.2f", time))dk * \(String(format: "%.2f", km))km * \(restaurant.minWage)TL"
        return RestaurantResponse(id: restaurant.id,
                                  imageURL: restaurant.imageURL,
                                  name: restaurant.name,
                                  kitches: kitches, restaurantInfo: restaurantInfo)
    }

}

//MARK: ViewToPresenterHomeProtocol + UICollectionViewDelegate,UICollectionViewDataSource
extension HomePresenter {
    
    
    func numberOfItemsIn(tag: Int) -> Int {
        switch tag {
        case 0:
            return kitchenList.count
        case 1:
            return restaurantLit.count
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
            return (state:restaurantArrayDesignState,
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
          
            
            return restaurantArrayDesignState ? 
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
    

    func sendRestaurantData(restaurant:[Restaurant]) {
        restaurantLit = restaurant
        view?.restaurantCollectionViewReload()
    }
    
}




