//
//  HomeModuleTests.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import XCTest
@testable import HomeModule
final class HomeModuleTests : XCTestCase {
    private var presenter: HomePresenter!
    private var view : MockHomeViewController!
    private var interactor : MockHomeInteractor!
    private var router:HomeRouter!
    
    override  func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view,interactor: interactor, router: router)
        
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        presenter = nil
        interactor = nil
    }
    
    
    func test_viewDidLoad_InvokesKitchenCollectionView(){
        XCTAssertFalse(view.invokedKitchenCollectionViewPrepare)
        XCTAssertFalse(view.invokedkitchenCollectionViewReload)
        XCTAssertEqual(view.invokedKitchenCollectionViewPrepareCount,0)
        XCTAssertEqual(view.invokedkitchenCollectionViewReloadCount,0)
        
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedKitchenCollectionViewPrepare)
        XCTAssertTrue(view.invokedkitchenCollectionViewReload)
        XCTAssertEqual(view.invokedKitchenCollectionViewPrepareCount,1)
        XCTAssertEqual(view.invokedkitchenCollectionViewReloadCount,1)
    }
    
    
    func test_viewDidLoad_InvokesOfferCollectionView(){
        XCTAssertFalse(view.invokedrestaurantCollectionViewPrepare)
        XCTAssertFalse(view.invokedrestaurantCollectionViewReload)
        XCTAssertEqual(view.invokedrestaurantCollectionViewReloadCount,0)
        XCTAssertEqual(view.invokedrestaurantCollectionViewPrepareCount,0)
        
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedrestaurantCollectionViewPrepare)
        XCTAssertTrue(view.invokedrestaurantCollectionViewReload)
        XCTAssertEqual(view.invokedrestaurantCollectionViewReloadCount,1)
        XCTAssertEqual(view.invokedrestaurantCollectionViewPrepareCount,1)
    }
    
    func test_viewDidLoad_changeTitle_ReturnHomePage(){
        XCTAssertFalse(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 0)
        presenter.viewDidLoad()
        XCTAssertEqual(view.invokedsetChangeTitleCount, 1)
        XCTAssertEqual(view.invokedsetChangeTitleData.map(\.title),["Home Page"])
    }
    
    func test_setTitles_viewDidLoad_ReturnKitchenAndOffer(){
        XCTAssertFalse(view.invokedSetTitles)
        XCTAssertEqual(view.invokedSetTitlesCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedSetTitles)
        XCTAssertEqual(view.invokedSetTitlesCount, 1)
        XCTAssertEqual(view.invokedSetTitlesData.map(\.kitchenText),["Kitchen"])
        XCTAssertEqual(view.invokedSetTitlesData.map(\.offerText),["Restaurants"])
        
        
    }
    
    func test_setBackColorAble_viewDidLoad_ReturnPrimaryBackColor(){
        XCTAssertFalse(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedsetBackColorAbleData.map(\.color),["#e0e0e0"])
    }
    
    
    func test_cellForItemTag0_returnStateBackcolorCornerradius(){
        presenter.viewDidLoad()
        let indexPath : IndexPath = [0,0]
        let item = presenter.cellForItem(at: indexPath, tag: 0)
        
        XCTAssertEqual(item.state,false)
        XCTAssertEqual(item.backColor, "#FFFFFF")
        XCTAssertEqual(item.cornerRadius, 10)
    }
    
    
    func test_WhenofferArrayDesignStateFalse_cellForItemTag1_returnStateBackcolorCornerradius(){
        presenter.viewDidLoad()
        let indexPath : IndexPath = [0,0]
        let item = presenter.cellForItem(at: indexPath, tag: 1)
        
        XCTAssertEqual(item.state,false)
        XCTAssertEqual(item.backColor, "#FFFFFF")
        XCTAssertEqual(item.cornerRadius, 10)
    }
    
    func test_WhenDidTapOfferArrayDesignStateFalse_cellForItemTag1_returnStateBackcolorCornerradius(){
        presenter.viewDidLoad()
        presenter.changeOfferArrayDesign()
        let indexPath : IndexPath = [0,0]
        let item = presenter.cellForItem(at: indexPath, tag: 1)
        
        XCTAssertEqual(item.state,true)
        XCTAssertEqual(item.backColor, "#FFFFFF")
        XCTAssertEqual(item.cornerRadius, 10)
    }
    
    
    func test_cellForItemTagDefault_returnStateBackcolorCornerradius(){
        presenter.viewDidLoad()
        let indexPath : IndexPath = [0,0]
        let item = presenter.cellForItem(at: indexPath, tag: 3)
        
        XCTAssertEqual(item.state,false)
        XCTAssertEqual(item.backColor, "#e0e0e0")
        XCTAssertEqual(item.cornerRadius, 0)
    }
    
    
    
    func test_tag0_defaultKitchen_returnSizeForItemAt(){
        presenter.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
     let item =   presenter.sizeForItemAt(tag: 0,
                                width: width,
                                height: height )
        let cellWidth = width / 4
        XCTAssertEqual(item.width,cellWidth - 10)
        XCTAssertEqual(item.height, cellWidth*1.2)
        
    }
    
    
    func test_tag1_returnSizeForItemAt(){
        presenter.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
     let item =   presenter.sizeForItemAt(tag: 1,
                                width: width,
                                height: height )
        
        XCTAssertEqual(item.width,width - 10)
        XCTAssertEqual(item.height, height / 4)
        
    }
    
    
    func test_tag1_changeOfferArrayDesign_returnSizeForItemAt(){
        presenter.viewDidLoad()
        presenter.changeOfferArrayDesign()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
     let item =   presenter.sizeForItemAt(tag: 1,
                                width: width,
                                height: height )
        
        XCTAssertEqual(item.width,width - 10)
        XCTAssertEqual(item.height, height / 8)
        
    }
    
    
    func test_tagDefault_returnSizeForItemAt(){
        presenter.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
     let item =   presenter.sizeForItemAt(tag: 3,
                                width: width,
                                height: height )
        
        XCTAssertEqual(item.width,0)
        XCTAssertEqual(item.height,0)
        
    }
    
    func test_viewDidLoad_returnSetChangeArrayButtonType(){
        presenter.viewDidLoad()
        XCTAssertTrue(view.involedsetChangeArrayButtonType)
        XCTAssertEqual(view.involedsetChangeArrayButtonTypeCount, 1)
        XCTAssertEqual(view.involedsetChangeArrayButtonTypeData.map(\.image),["lineweight"])
        
    }
    
    func test_WhenChangeOfferArrayDesign_returnSetChangeArrayButtonType(){
        presenter.changeOfferArrayDesign()
        XCTAssertTrue(view.involedsetChangeArrayButtonType)
        XCTAssertEqual(view.involedsetChangeArrayButtonTypeCount, 1)
        XCTAssertEqual(view.involedsetChangeArrayButtonTypeData.map(\.image),["list.dash"])
    }
    
    func test_fetchKitchens_success_shouldReloadCollectionView(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedkitchenCollectionViewReload)
        XCTAssertEqual(view.invokedKitchenCollectionViewPrepareCount,0)
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedkitchenCollectionViewReload)
            XCTAssertEqual(self.view.invokedKitchenCollectionViewPrepareCount,1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_fetchKitchens_error_shouldCreateAlertMessage(){
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(view.involedCreateAlertMessage)
        XCTAssertEqual(view.involedCreateAlertMessageCount,0)
        
        interactor.mockFetchKitchesReturnError = true
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertEqual(self.view.involedCreateAlertMessageData.map(\.title),["Error"])
            XCTAssertEqual(self.view.involedCreateAlertMessageData.map(\.message),["Something went wrong"])
            XCTAssertEqual(self.view.involedCreateAlertMessageData.map(\.actionTitle),["Ok"])
            
            XCTAssertEqual(self.view.involedCreateAlertMessageCount,1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    
    func test_fetchRestaurant_success_shouldReloadCollectionView(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedrestaurantCollectionViewReload)
        XCTAssertEqual(view.invokedrestaurantCollectionViewPrepareCount,0)
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedrestaurantCollectionViewReload)
            XCTAssertEqual(self.view.invokedrestaurantCollectionViewPrepareCount,1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_fetchRestaurant_error_shouldCreateAlertMessage(){
        let expectation = XCTestExpectation(description: "Async task completed")
        
        XCTAssertFalse(view.invokedrestaurantCollectionViewReload)
        XCTAssertEqual(view.invokedrestaurantCollectionViewPrepareCount,0)
        
        interactor.mockFetchRestaurantError = true
        presenter.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertEqual(self.view.involedCreateAlertMessageData.map(\.title),["Error"])
            XCTAssertEqual(self.view.involedCreateAlertMessageData.map(\.message),["Something went wrong"])
            XCTAssertEqual(self.view.involedCreateAlertMessageData.map(\.actionTitle),["Ok"])
            
            XCTAssertEqual(self.view.involedCreateAlertMessageCount,1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

}
