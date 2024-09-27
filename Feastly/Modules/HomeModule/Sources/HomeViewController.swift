//
//  HomeViewController.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var presenter : ViewToPresenterHomeProtocol = HomePresenter(view: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .red
    }
}


extension HomeViewController : PresenterToViewHomeProtocol {
    func kitchenCollectionViewReload() {
        
    }
    
    func kitchenCollectionViewPrepare() {
        
    }
    
    func offerCollectionViewReload() {
        
    }
    
    func offerCollectionViewPrepare() {
        
    }
    
    
}
