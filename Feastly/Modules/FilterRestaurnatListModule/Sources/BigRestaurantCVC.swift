//
//  BigSmallCVC.swift
//  FilterRestaurnatListModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import Foundation

import UIKit
import Kingfisher
import CommonKit
import SnapKit
class BigRestaurantCVC: UICollectionViewCell {
    static let identifier :  String = "bigRestaurant"
    
    private lazy var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var restaurantName = UILabel.cellTitleBoldUILabel()
    private lazy var kitchensInfo = UILabel.secondaryCellTitleUILabel()
    private lazy var restaurantInfo = UILabel.secondaryCellTitleUILabel()
    private lazy var infoUIView = UIView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        infoUIView.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
    }
    
    
    private func configureUI(){
        contentView.addSubview(restaurantImageView)
        restaurantImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        restaurantImageView.addSubview(infoUIView)
        infoUIView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo( contentView.bounds.height / 3)
        }
        
        infoUIView.addSubview(restaurantName)
        restaurantName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        infoUIView.addSubview(kitchensInfo)
        kitchensInfo.snp.makeConstraints { make in
            make.top.equalTo(restaurantName.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        infoUIView.addSubview(restaurantInfo)
        restaurantInfo.snp.makeConstraints { make in
            make.top.equalTo(restaurantName.snp.bottom).offset(10)
            make.leading.equalTo(kitchensInfo.snp.trailing).offset(5)
        }
        
       
    }
    
    
    func configureData(data:RestaurantResponse){
        let url =  URL(string: data.imageURL)
        restaurantImageView.kf.setImage(with: url)
        restaurantName.text = data.name
        kitchensInfo.text = data.kitches
        restaurantInfo.text = data.restaurantInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
