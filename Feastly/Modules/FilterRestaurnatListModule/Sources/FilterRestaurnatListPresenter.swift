//
//  FilterRestaurnatListPresenter.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import CommonKit
import CoreLocation

final class FilterRestaurnatListPresenter {
    weak var view:PresenterToViewFilterRestaurantListProtocol?
    private var interactor: PresenterToInteractorFilterRestaurantListProtocol
    private var router:PresenterToRouterFilterRestaurantListProtocol
    private var filterRestaurantLit:[Restaurant] = []
    
    
    init(view: PresenterToViewFilterRestaurantListProtocol?, 
         interactor: PresenterToInteractorFilterRestaurantListProtocol,
         router: PresenterToRouterFilterRestaurantListProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
    }
    
    private func fetchRestaurant(list:[String]) async {
        
        do{
            try await interactor.fetchRestaurantFilter(list: list)
        }catch{
            view?.createAlertMesssage(title: TextTheme.primaryErrorTitle.rawValue,
                                      message: TextTheme.primaryErrorMessage.rawValue,
                                      actionTitle: TextTheme.primaryErrorActionTitle.rawValue)
        }
        
    }
    
}


//MARK: ViewToPresenterHomeProtocol

extension FilterRestaurnatListPresenter : ViewToPresenterFilterRestaurantListProtocol {
    func minimumLineSpacingForSectionAt() -> CGFloat {
        return 10
    }
    
    func insetForSectionAt() -> (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        return (top: 0, left: 10, right: 0, bottom: 10)
    }
    
    func viewDidLoad() {
        view?.restaurantCollectionViewPrepare()
        view?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        
        view?.changeTitle(title: TextTheme.filteredRestaurants.rawValue)
    }
    
    func numberOfItemsIn() -> Int {
        return filterRestaurantLit.count
    }
    
    func cellForItem(at indexPath: IndexPath) -> (restaurant:RestaurantResponse,
                                                  backColor: String,
                                                  cornerRadius: CGFloat) {
        let restaurant = filterRestaurantLit[indexPath.item]
        let kitches = restaurant.kitchens.map { $0.name }.joined(separator:", ")
        let restaurantLocation = CLLocation(latitude: restaurant.latitude, longitude: restaurant.longitude)
        //NOTE: Detafault Location was used because CLLocation gave error on simulator.
        let userLocation = CLLocation(latitude: 41.09732, longitude: 29.03126)
        let km = restaurantLocation.distance(from: userLocation) / 1000
        let time = km / 25
        let restaurantInfo = " * \(String(format: "%.2f", time))dk * \(String(format: "%.2f", km))km * \(restaurant.minWage)TL"
        let response = RestaurantResponse(id: restaurant.id,
                                          imageURL: restaurant.imageURL,
                                          name: restaurant.name,
                                          kitches: kitches, restaurantInfo: restaurantInfo)
        return (restaurant:response,backColor:ColorTheme.secondaryBackColor.rawValue,cornerRadius:10)
        
    }
    
    func didSelectItem(at indePath: IndexPath) {
        let id = filterRestaurantLit[indePath.item].id
        router.toRestaurantDetail(view: view, id: id)
    }
    
    func sizeForItemAt(width: CGFloat, height: CGFloat) -> CGSize {
        return   CGSize(width: width - 10, height: height / 4)
    }
    
    func getSelectedList(list: [String]) {
        view?.startActivityIndicator()
        Task {
            await fetchRestaurant(list: list)
        }
        view?.stopActivityIndicator()
    }
}

//MARK: InteractorToPresenterFilterRestaurantListProtocol
extension FilterRestaurnatListPresenter : InteractorToPresenterFilterRestaurantListProtocol {
    func sendRestaurantData(restaurants: [Restaurant]) {
        filterRestaurantLit = restaurants
        view?.setTitles(filterRestaurantTitle: "\(TextTheme.filteredRestaurants.rawValue)(\(filterRestaurantLit.count))")
        view?.restaurantCollectionViewReload()
    }
    
    
}


