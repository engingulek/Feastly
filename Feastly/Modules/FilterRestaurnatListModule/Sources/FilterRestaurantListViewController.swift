//
//  FilterRestaurantListViewController.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import UIKit
import SnapKit
import CommonKit
class FilterRestaurantListViewController: UIViewController {
    lazy var presenter : ViewToPresenterFilterRestaurantListProtocol = FilterRestaurnatListPresenter(view: self, interactor: FilterRestaurantListInteractor(), router: FilterRestaurnatListRouter())
    private lazy var  filteredRestaurantColectionView = UICollectionView.primaryCollectionView(tag: 0,scroolDirection: .vertical)
    private lazy var filteredRestaurantTitle  =  UILabel.secondarytitleUILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        filteredRestaurantColectionView.register(BigRestaurantCVC.self, forCellWithReuseIdentifier: BigRestaurantCVC.identifier)
        presenter.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(filteredRestaurantTitle)
        filteredRestaurantTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        
        view.addSubview(filteredRestaurantColectionView)
        filteredRestaurantColectionView.snp.makeConstraints { make in
            make.top.equalTo(filteredRestaurantTitle.snp.bottom).offset(15)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: PresenterToViewFilterRestaurantListProtocol
extension FilterRestaurantListViewController : PresenterToViewFilterRestaurantListProtocol {
    func restaurantCollectionViewPrepare() {
        filteredRestaurantColectionView.delegate = self
        filteredRestaurantColectionView.dataSource = self
    }
    
    func restaurantCollectionViewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            filteredRestaurantColectionView.reloadData()
            
        }
    }
    
    func setTitles(filterRestaurantTitle: String) {
        filteredRestaurantTitle.text = filterRestaurantTitle
    }
    
}

extension FilterRestaurantListViewController : UICollectionViewDelegate,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = filteredRestaurantColectionView.dequeueReusableCell(withReuseIdentifier: BigRestaurantCVC.identifier, for: indexPath) as? BigRestaurantCVC else {return UICollectionViewCell()}
        let item = presenter.cellForItem(at: indexPath)
        cell.configureData(data: item.restaurant)
        cell.backgroundColor =  UIColor(hex: item.backColor)
        cell.layer.cornerRadius = item.cornerRadius
        return cell
    }
}


extension FilterRestaurantListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItemAt(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
