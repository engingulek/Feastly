//
//  RestaurantMenuCVC.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import UIKit
import Kingfisher
import SnapKit
class RestaurantMenuCVC: UICollectionViewCell {
    static let identifier:String = "restaurantMenuCVC"
    private lazy var menuimage : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    private lazy var menuNameLabel = UILabel.cellTitleBoldUILabel(alignment: .left)
    private lazy var menuInfoLabel = UILabel.secondaryCellTitleUILabel(alignment: .left,numberOfLines: 3)
    private lazy var priceMenuLabel = UILabel.cellTitleBoldUILabel(alignment: .left)
    private lazy var addCartButton = UIButton.primaryButton(text: "+")
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
       
    }
    
    
    private func configureUI(){
        contentView.addSubview(menuimage)
        menuimage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(100)
        }
        
        contentView.addSubview(menuNameLabel)
        menuNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalTo(menuimage.snp.leading)
            
        }
        
        contentView.addSubview(menuInfoLabel)
        menuInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(menuNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalTo(menuimage.snp.leading)
            
        }
        
        contentView.addSubview(priceMenuLabel)
        priceMenuLabel.snp.makeConstraints { make in
            make.top.equalTo(menuInfoLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(5)
            
        }
        
        contentView.addSubview(addCartButton)
        addCartButton.snp.makeConstraints { make in
            make.top.equalTo(priceMenuLabel.snp.top)
            make.leading.equalTo(priceMenuLabel.snp.trailing).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    func configureData(menu:Menu){
        menuNameLabel.text = menu.name
        menuInfoLabel.text = menu.description
        priceMenuLabel.text = "\(menu.price)"
        let url = URL(string: menu.imageURL)
        menuimage.kf.setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
