//
//  FilterRestaurnatTests.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation
import XCTest
@testable import FilterRestaurnatListModule
final class FilterRestaurnatTests : XCTestCase {
    private var presenter : FilterRestaurnatListPresenter!
    private var view: MockFilterRestaurantListViewController!
    private var interactor: MockInteractor!
    private var router: FilterRestaurnatListRouter!
    
    override  func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view,interactor: interactor , router: router)
        
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        presenter = nil
        interactor = nil
    }
    
    func test_viewDidLoad_InvokesRestauranttCollectionView(){
        XCTAssertFalse(view.invokedrestaurantCollectionViewPrepare)
        XCTAssertEqual(view.invokedrestaurantCollectionViewPrepareCount,0)
        
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedrestaurantCollectionViewPrepare)
        XCTAssertEqual(view.invokedrestaurantCollectionViewPrepareCount,1)
    }
    
    func test_sendRestaurantData_RestauranttCollectionViewRelaodData() {
        XCTAssertFalse(view.invokedrestaurantCollectionViewReload)
        XCTAssertEqual(view.invokedrestaurantCollectionViewReloadCount,0)
        
        presenter.getSelectedList(list: ["testId"])
        presenter.sendRestaurantData(restaurants: [ .init(
            id: "testid",
            name: "name",
            kitchens: [.init(id: "id", name: "name")],
            imageURL: "",
            latitude: 0,
            longitude: 0,
            minWage: 100)])
        XCTAssertTrue(view.invokedrestaurantCollectionViewReload)
        XCTAssertEqual(view.invokedrestaurantCollectionViewReloadCount,1)
    }
    
    func test_viewDidLoad_changeTitle_ReturnFilteredRestaurants(){
        XCTAssertFalse(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 0)
        presenter.viewDidLoad()
        XCTAssertEqual(view.invokedsetChangeTitleCount, 1)
        XCTAssertEqual(view.invokedsetChangeTitleData.map(\.title),["Filtered Testaurants"])
    }
    
    func test_setBackColorAble_viewDidLoad_ReturnPrimaryBackColor(){
        XCTAssertFalse(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedsetBackColorAbleData.map(\.color),["#e0e0e0"])
    }
    
   
    
    func test_returnSizeForItemAt(){
        presenter.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
     let item =   presenter.sizeForItemAt(
                                width: width,
                                height: height )
      
        XCTAssertEqual(item.width,width - 10)
        XCTAssertEqual(item.height, height / 4)
        
    }
    
    func test_startActivitiyIndicator(){
        XCTAssertFalse(view.invokedStartActiviyIndicator)
        XCTAssertEqual(view.invokedStartActiviyIndicatorCount,0)
        
        presenter.getSelectedList(list: ["testId"])
        presenter.sendRestaurantData(restaurants: [ .init(
            id: "testid",
            name: "name",
            kitchens: [.init(id: "id", name: "name")],
            imageURL: "",
            latitude: 0,
            longitude: 0,
            minWage: 100)])
        
        
        XCTAssertTrue(view.invokedStartActiviyIndicator)
        XCTAssertEqual(view.invokedStartActiviyIndicatorCount,1)
        
        
    }
    
    
    func test_stopActivitiyIndicator(){
        XCTAssertFalse(view.invokedStopActivityIndicator)
        XCTAssertEqual(view.invokedStopActivityIndicatorCount,0)
        
        presenter.getSelectedList(list: ["testId"])
        presenter.sendRestaurantData(restaurants: [ .init(
            id: "testid",
            name: "name",
            kitchens: [.init(id: "id", name: "name")],
            imageURL: "",
            latitude: 0,
            longitude: 0,
            minWage: 100)])
        
        
        XCTAssertTrue(view.invokedStopActivityIndicator)
        XCTAssertEqual(view.invokedStopActivityIndicatorCount,1)
    }
    
    
    func test_minimumLineSpacingForSectionAt(){
        presenter.viewDidLoad()
        let item = presenter.minimumLineSpacingForSectionAt()
        XCTAssertEqual(item,10)
    }
    
    func test_insetForSectionAt(){
        let item = presenter.insetForSectionAt()
        presenter.viewDidLoad()
        
        XCTAssertEqual(item.top,0)
        XCTAssertEqual(item.left, 10)
        XCTAssertEqual(item.right,0)
        XCTAssertEqual(item.bottom, 10)
    }
    
}
