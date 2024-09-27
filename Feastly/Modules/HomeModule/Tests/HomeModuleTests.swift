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
    
    override  func setUp() {
        super.setUp()
        view = .init()
        presenter = .init(view: view)
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        presenter = nil
    }
    
    func test_twoPlusTwo_isFour() {
        XCTAssertEqual(2+2, 4)
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
        XCTAssertFalse(view.invokedofferCollectionViewPrepare)
        XCTAssertFalse(view.invokedofferCollectionViewReload)
        XCTAssertEqual(view.invokedOfferCollectionViewPrepareCount,0)
        XCTAssertEqual(view.invokedofferCollectionViewReloadCount,0)
        
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedofferCollectionViewPrepare)
        XCTAssertTrue(view.invokedofferCollectionViewReload)
        XCTAssertEqual(view.invokedOfferCollectionViewPrepareCount,1)
        XCTAssertEqual(view.invokedofferCollectionViewReloadCount,1)
    }
    
    func test_setTitles_viewDidLoad_ReturnKitchenAndOffer(){
        XCTAssertFalse(view.invokedSetTitles)
        XCTAssertEqual(view.invokedSetTitlesCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedSetTitles)
        XCTAssertEqual(view.invokedSetTitlesCount, 1)
        XCTAssertEqual(view.invokedSetTitlesData.map(\.kitchenText),["Kitchen"])
        XCTAssertEqual(view.invokedSetTitlesData.map(\.offerText),["Offer"])
        
        
    }
    
    func test_setBackColorAble_viewDidLoad_ReturnPrimaryBackColor(){
        XCTAssertFalse(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedsetBackColorAbleData.map(\.color),["#e0e0e0"])
        
        
        
    }

}
