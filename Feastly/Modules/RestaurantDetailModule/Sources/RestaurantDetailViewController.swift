//
//  RestaurantDetailViewController.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import UIKit
import SnapKit
import CommonKit
class RestaurantDetailViewController: UIViewController {
    
    lazy var presenter : ViewToPresenterRestaurantDetailProtocol = RestaurantDetailPresenter(
        view: self,
        interactor: RestaurantDetailInteractor(),
    router: RestaurantDetailRouter())
    
    private lazy var restaurantInfoView = RestaurantInfoUIView(frame: .infinite)
    private lazy var restaurantMenuCollectionView = UICollectionView.primaryCollectionView(tag: 0, scroolDirection: .vertical)
    private lazy var listTitleLabel:UILabel = UILabel.titleUILabel()
    private lazy var addCartButton = UIButton.primaryButton(text: "+")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        restaurantMenuCollectionView.register(RestaurantMenuCVC.self, forCellWithReuseIdentifier: RestaurantMenuCVC.identifier)
        view.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(restaurantInfoView)
        restaurantInfoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(UIScreen.main.bounds.height / 5)
        }
        view.addSubview(listTitleLabel)
        listTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(restaurantInfoView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
        view.addSubview(restaurantMenuCollectionView)
        restaurantMenuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(listTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
      
    }
}

extension RestaurantDetailViewController  : PresenterToViewRestaurantDetailProtocol {
    
    
    func restaurantMenusCollectionViewPrepare() {
        restaurantMenuCollectionView.delegate = self
        restaurantMenuCollectionView.dataSource = self
    }
    
    func restaurantMenusCollectionViewRealoadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            restaurantMenuCollectionView.reloadData()
            
        }
    }
    
    func setTitle(menuText: String) {
        listTitleLabel.text = menuText
    }
    
    func setDetailView(detail: RestaurantDetail) {
        restaurantInfoView.configureData(detail: detail)
    }
    
    
    
    
}


extension RestaurantDetailViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantMenuCVC.identifier, for: indexPath) as?
                RestaurantMenuCVC else {return UICollectionViewCell()}
        //let item = presenter.cellForItem(at: indexPath)
        cell.backgroundColor = .white //UIColor(hex: item.backColor)
        cell.layer.cornerRadius = 10 //item.cornerRadius
        return cell
    }
    
}


extension RestaurantDetailViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItemAt(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}


