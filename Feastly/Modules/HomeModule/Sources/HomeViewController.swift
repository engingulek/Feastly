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
    
    lazy var presenter : ViewToPresenterHomeProtocol = HomePresenter(view: self)
    private lazy var kitchenColectionView = UICollectionView.primaryCollectionView(tag: 0,scroolDirection: .horizontal)
    private lazy var offerColectionView = UICollectionView.primaryCollectionView(tag: 1,scroolDirection: .vertical)
    private lazy var kitchenTitleLabel = UILabel.titleUILabel()
    private lazy var offerTitleLabel = UILabel.titleUILabel()
    private lazy var searchTextField = UISearchTextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kitchenColectionView.register(KitchenCVC.self, forCellWithReuseIdentifier: KitchenCVC.identifier)
        offerColectionView.register(OfferCVC.self, forCellWithReuseIdentifier: OfferCVC.identifier)
        presenter.viewDidLoad()
        configureUI()
        searchTextField.addTarget(self,
                                  action: #selector(searchTextFieldDidChange(_:)),
                                  for: .editingChanged)
    }
    
    @objc func searchTextFieldDidChange(_ textField: UITextField) {
        presenter.searchAction(text: textField.text)
    }
    
    private func configureUI(){
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
        view.addSubview(kitchenTitleLabel)
        kitchenTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view)
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
            make.trailing.equalTo(view)
        }

        
        view.addSubview(offerColectionView)
        offerColectionView.snp.makeConstraints { make in
            make.top.equalTo(offerTitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}


extension HomeViewController : PresenterToViewHomeProtocol {
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
    
    func offerCollectionViewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            offerColectionView.reloadData()
            
        }
    }
    
    func offerCollectionViewPrepare() {
        offerColectionView.delegate = self
        offerColectionView.dataSource = self
    }
    
    func setTitles(kitchenText: String, offerText: String) {
        kitchenTitleLabel.text = kitchenText
        offerTitleLabel.text = offerText
    }
}



extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KitchenCVC.identifier, for: indexPath) as? KitchenCVC else {return UICollectionViewCell()}
            cell.backgroundColor = .red
            cell.layer.cornerRadius = 10
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCVC.identifier, for: indexPath) as? OfferCVC else {return UICollectionViewCell()}
            cell.backgroundColor = .blue
            cell.layer.cornerRadius = 10

            return cell
        default:
            return UICollectionViewCell()
            
        }
     
    }
}


extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = UIScreen.main.bounds.width
            let cellWidth = width / 4
            
            return CGSize(width: cellWidth, height: cellWidth * 1.2)
        case 1:
            
            let width = UIScreen.main.bounds.width
            let height = UIScreen.main.bounds.height
    
            
            return CGSize(width: width - 10, height: height / 4)
        default:
            return CGSize(width: 0, height: 0)
            
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}
