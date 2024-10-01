//
//  AllKitchesModuleTests.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import XCTest
import CommonKit
@testable import AllKitchensModule

final class AllKitchesModuleTests : XCTestCase {
    private var presenter:AllKitchensPresenter!
    private var view:MockAllKitchensViewController!
    private var interactor:MockAllKitchensInteractor!
    private var router:AllKitchensRouter!
    
    override  func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(view: view, interactor: interactor, router: router)
        
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
    
    func test_viewDidLoad_changeTitle_ReturnHomePage(){
        XCTAssertFalse(view.invokedsetChangeTitle)
        XCTAssertEqual(view.invokedsetChangeTitleCount, 0)
        presenter.viewDidLoad()
        XCTAssertEqual(view.invokedsetChangeTitleCount, 1)
        XCTAssertEqual(view.invokedsetChangeTitleData.map(\.title),["All Kitchens"])
    }
    
    func test_setBackColorAble_viewDidLoad_ReturnPrimaryBackColor(){
        XCTAssertFalse(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokedsetBackColorAbleCount, 1)
        XCTAssertEqual(view.invokedsetBackColorAbleData.map(\.color),["#e0e0e0"])
    }
    
    
    func test_cell_returnSizeForItemAt(){
        presenter.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
     let item =   presenter.sizeForItemAt(
                                width: width,
                                height: height )
        let cellWidth = width / 4
        XCTAssertEqual(item.width,cellWidth - 10)
        XCTAssertEqual(item.height, cellWidth*1.2)
    }
    
    func test_cell_insetForSectionAt(){
        presenter.viewDidLoad()
        let item = presenter.insetForSectionAt()
        XCTAssertEqual(item.top,0)
        XCTAssertEqual(item.left, 10)
        XCTAssertEqual(item.right,0)
        XCTAssertEqual(item.bottom, 0)
    }
    
    func test_viewDidload_cellForItem_WhenSelectedKithenListEmpty(){
        let expectation = XCTestExpectation(description: "Async task completed")
        self.presenter.viewDidLoad()
        self.presenter.sendKitchenData(kitchens: [.init(id: "TestId", name: "TestName", imageUrl: "TestImageUrl")])
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let count = self.presenter.numberOfItemsIn()
            [0,count-1].forEach { i in
                let indexPath:IndexPath = [0,i]
                let item = self.presenter.cellForItem(at: indexPath)
                XCTAssertEqual(item.cellBorderColor, "#e0e0e0")
                XCTAssertEqual(item.cornerRadius, 10)
                XCTAssertEqual(item.backColor, "#FFFFFF")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_viewDidload_cellForItem_WhenSelectedKithenList(){
        let expectation = XCTestExpectation(description: "Async task completed")
        self.presenter.viewDidLoad()
        self.presenter.sendKitchenData(kitchens: [
            .init(id: "TestId", name: "TestName", imageUrl: "TestImageUrl")])
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           
            self.presenter.didSelectItem(at: [0,0])
            let item = self.presenter.cellForItem(at: [0,0])
            XCTAssertEqual(item.cellBorderColor, "#FF6600")
            XCTAssertEqual(item.cornerRadius, 10)
            XCTAssertEqual(item.backColor, "#FFFFFF")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_viewDidLoad_listKitchenIsEnables(){
        XCTAssertFalse(view.invokedListKitchenIsEnabled)
        XCTAssertEqual(view.invokedListKitchenIsEnabledCount,0)
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedListKitchenIsEnabled)
        XCTAssertEqual(view.invokedListKitchenIsEnabledCount,1)
        
        XCTAssertEqual(view.invokedListKitchenIsEnabledData.map(\.backColor),["#FFBF78"])
        XCTAssertEqual(view.invokedListKitchenIsEnabledData.map(\.isEnabled),[false])
                       
    }
    
    
    func test_viewDidLoad_clearButtonHidden(){
        XCTAssertFalse(view.invokedClearButtonHidden)
        XCTAssertEqual(view.invokedClearButtonHiddenCount,0)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedClearButtonHidden)
        XCTAssertEqual(view.invokedClearButtonHiddenCount,1)
        XCTAssertEqual(view.invokedClearButtonHiddenData.map(\.isHidden),[true])
    }
    
    func test_didSelectItem_clearButtonHidden(){
        XCTAssertFalse(view.invokedClearButtonHidden)
        XCTAssertEqual(view.invokedClearButtonHiddenCount,0)
        
        self.presenter.sendKitchenData(kitchens: [
            .init(id: "TestId", name: "TestName", imageUrl: "TestImageUrl")])
        
        
        let expectation = XCTestExpectation(description: "Async task completed")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           
            self.presenter.didSelectItem(at: [0,0])
            XCTAssertTrue(self.view.invokedClearButtonHidden)
            XCTAssertEqual(self.view.invokedClearButtonHiddenData.map(\.isHidden),[false])
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
}
