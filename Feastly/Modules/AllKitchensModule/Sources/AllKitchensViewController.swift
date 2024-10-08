//
//  AllKitchensViewController.swift
//  AllKitchensModule
//
//  Created by Engin Gülek on 29.09.2024.
//

import UIKit
import SnapKit
import CommonKit
class AllKitchensViewController: UIViewController {
    lazy var presenter : ViewToPresenterAllKitchensProtocol = AllKitchensPresenter(view: self, interactor: AllKitchensInteractor(), router: AllKitchensRouter())
    private lazy var kitchenColectionView = UICollectionView.primaryCollectionView(tag: 0,scroolDirection: .vertical)
    private lazy var listRestaurantButton = UIButton.primaryButton(text: TextTheme.listRestaurants.rawValue)
    private lazy var rightBarButton = UIBarButtonItem(title: TextTheme.clear.rawValue, style: .plain, target: self, action: #selector(rightBarButtonTapped))
    
    private lazy var listRestaurantButtonAction : UIAction = UIAction { _ in
        self.presenter.didTappedListRestaurantButton()
    }
    
    override func viewDidLoad() {
        listRestaurantButton.addAction(listRestaurantButtonAction, for: .touchUpInside)
        super.viewDidLoad()
        kitchenColectionView.register(KitchenCVC.self, forCellWithReuseIdentifier: KitchenCVC.identifier)
        presenter.viewDidLoad()
        navigationItem.rightBarButtonItem = rightBarButton
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(kitchenColectionView)
        kitchenColectionView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(view.bounds.height - 110)
        }
        
        view.addSubview(listRestaurantButton)
        listRestaurantButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
    }
    
    @objc func rightBarButtonTapped(){
        presenter.clearAllList()
    }
}


//MARK: PresenterToViewAllKitchensProtocol
extension AllKitchensViewController : PresenterToViewAllKitchensProtocol {
    
    
    func kitchenCollectionViewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            kitchenColectionView.reloadData()
        }
    }
    
    func kitchenCollectionViewPrepare() {
        kitchenColectionView.delegate = self
        kitchenColectionView.dataSource = self
    }
    
    
    func listKitchenIsEnables(isEnabled: Bool,backColor:String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            listRestaurantButton.isEnabled = isEnabled
            listRestaurantButton.backgroundColor = UIColor(hex: backColor)
        }
    }
    
    func clearButtonHidden(isHidden: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            rightBarButton.isHidden = isHidden
        }
    }
}


//MARK:  UICollectionViewDelegate,UICollectionViewDataSource
extension AllKitchensViewController :  UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KitchenCVC.identifier, 
                                                            for: indexPath) as? KitchenCVC else {return UICollectionViewCell()}
        let item = presenter.cellForItem(at: indexPath)
        cell.configureData(kitchen: item.kitchen)
        cell.backgroundColor = UIColor(hex: item.backColor)
        cell.layer.cornerRadius = item.cornerRadius
        cell.layer.borderColor = UIColor(hex: item.cellBorderColor)?.cgColor
        cell.layer.borderWidth = item.borderWidth
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension AllKitchensViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter.sizeForItemAt(width: UIScreen.main.bounds.width,
                                       height: UIScreen.main.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let item = presenter.insetForSectionAt()
        return UIEdgeInsets(top: item.top,
                            left: item.left,
                            bottom: item.bottom,
                            right: item.right)
    }
}
