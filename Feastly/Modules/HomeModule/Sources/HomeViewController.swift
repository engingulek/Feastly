//
//  HomeViewController.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import UIKit
import SnapKit
import CommonKit
class HomeViewController: UIViewController {
    
    lazy var presenter : ViewToPresenterHomeProtocol = HomePresenter(view: self,interactor: HomeInteractor(),router: HomeRouter())
    private lazy var kitchenColectionView = UICollectionView.primaryCollectionView(tag: 0,scroolDirection: .horizontal)
    private lazy var restaurantColectionView = UICollectionView.primaryCollectionView(tag: 1,scroolDirection: .vertical)
    private lazy var kitchenTitleLabel = UILabel.titleUILabel()
    private lazy var offerTitleLabel = UILabel.titleUILabel()
    
    private lazy var allKitchensButton = UIButton.textButton(text: TextTheme.allKitchens.rawValue)
    private lazy var changeArrayTypeButton : UIButton = {
        let button = UIButton()
        
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.sizeToFit()
        button.center = view.center
        button.tintColor = UIColor(hex: ColorTheme.secondaryLabelColor.rawValue)
        button.setTitleColor( UIColor(hex: ColorTheme.secondaryLabelColor.rawValue), for: .normal)
        button.addAction(changeArrayTypeButtonAction, for: .touchUpInside)
        return button
    }()
    
    private lazy var changeArrayTypeButtonAction : UIAction = UIAction { _ in
        self.presenter.changeOfferArrayDesign()
    }
    
    private lazy var allKitchensButtonAction : UIAction  = UIAction {_ in
        self.presenter.didTappedAllKitchensButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kitchenColectionView.register(KitchenCVC.self, forCellWithReuseIdentifier: KitchenCVC.identifier)
        restaurantColectionView.register(BigRestaurantCVC.self, forCellWithReuseIdentifier: BigRestaurantCVC.identifier)
        restaurantColectionView.register(SmallRestaurantCVC.self, forCellWithReuseIdentifier: SmallRestaurantCVC.identifier)
        allKitchensButton.addAction(allKitchensButtonAction, for: .touchUpInside)
        presenter.viewDidLoad()
        configureUI()
       
    }
    
  
    private func configureUI(){
        
        view.addSubview(kitchenTitleLabel)
        kitchenTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(view).offset(10)
        }
        
        view.addSubview(allKitchensButton)
        allKitchensButton.snp.makeConstraints { make in
            make.top.equalTo(kitchenTitleLabel.snp.top)
            make.trailing.equalTo(view).offset(-10)
        }
        
        view.addSubview(kitchenColectionView)
        kitchenColectionView.snp.makeConstraints { make in
            make.top.equalTo(kitchenTitleLabel.snp.bottom)
            make.height.equalTo(150)
            make.leading.trailing.equalTo(view)
        }
        
        
        view.addSubview(offerTitleLabel)
        offerTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(kitchenColectionView.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            
        }
        
        view.addSubview(changeArrayTypeButton)
        changeArrayTypeButton.snp.makeConstraints { make in
            make.top.equalTo(offerTitleLabel.snp.top)
            make.trailing.equalTo(view).offset(-10)
        }
        
        view.addSubview(restaurantColectionView)
        restaurantColectionView.snp.makeConstraints { make in
            make.top.equalTo(offerTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}

//MARK: PresenterToViewHomeProtocol
extension HomeViewController : PresenterToViewHomeProtocol {
    
    
    func setChangeArrayButtonType(image: String, text: String) {
        changeArrayTypeButton.setTitle(text, for: .normal)
        let image =  UIImage(systemName: image)
        changeArrayTypeButton.setImage(image, for: .normal)
        
    }
    
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
    
    
    func restaurantCollectionViewPrepare() {
        restaurantColectionView.delegate = self
        restaurantColectionView.dataSource = self
    }
    
    func restaurantCollectionViewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            restaurantColectionView.reloadData()
            
        }
    }
    
    func setTitles(kitchenText: String, offerText: String) {
        kitchenTitleLabel.text = kitchenText
        offerTitleLabel.text = offerText
    }
}


//MARK: UICollectionViewDelegate,UICollectionViewDataSource
extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsIn(tag: collectionView.tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KitchenCVC.identifier, for: indexPath) as? KitchenCVC else {return UICollectionViewCell()}
            let item = presenter.cellForItem(at: indexPath, tag: 0)
            let kitchen = presenter.cellItemForKitchen(at: indexPath)
            cell.configureData(kitchen:kitchen )
            cell.backgroundColor = UIColor(hex: item.backColor)
            cell.layer.cornerRadius = item.cornerRadius
            return cell
        case 1:
            guard let bigCell = collectionView.dequeueReusableCell(withReuseIdentifier: BigRestaurantCVC.identifier,
                                                                   for: indexPath) as? BigRestaurantCVC else {return UICollectionViewCell()}
            guard let smallCell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallRestaurantCVC.identifier,
                                                                     for: indexPath) as? SmallRestaurantCVC else {return UICollectionViewCell()}
            let item = presenter.cellForItem(at: indexPath, tag: 1)
            let restaurant = presenter.cellItemForRestaurant(at: indexPath)
            smallCell.configureData(data: restaurant)
            smallCell.backgroundColor = UIColor(hex: item.backColor)
            smallCell.layer.cornerRadius = item.cornerRadius
            bigCell.backgroundColor =  UIColor(hex: item.backColor)
            bigCell.layer.cornerRadius = item.cornerRadius
            bigCell.configureData(data: restaurant)
            
            return item.state ? smallCell : bigCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelecetItem(at: indexPath, tag: 0)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let size = presenter.sizeForItemAt(tag: 0,
                                               width: UIScreen.main.bounds.width,
                                               height: UIScreen.main.bounds.height)
            return size
        case 1:
            let size = presenter.sizeForItemAt(tag: 1,
                                               width: UIScreen.main.bounds.width,
                                               height: UIScreen.main.bounds.height)
            return size
        default:
            return CGSize(width: 0, height: 0)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return presenter.minimumLineSpacingForSectionAt()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let item = presenter.insetForSectionAt()
        return UIEdgeInsets(top: item.top,
                            left: item.left,
                            bottom: item.bottom,
                            right: item.right)
    }
    
}
