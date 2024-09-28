//
//  SmallOfferCVC.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import UIKit
import Kingfisher
import SnapKit
import CommonKit
class SmallRestaurantCVC: UICollectionViewCell {
    static let identifier = "smallOfferCVC"
    
    private lazy var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var restaurantName = UILabel.cellTitleBoldUILabel()
    private lazy var kitchensInfo = UILabel.secondaryCellTitleUILabel()
    private lazy var restaurantInfo = UILabel.secondaryCellTitleUILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI(){
        contentView.addSubview(restaurantImageView)
        restaurantImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(100)
        }
        
        contentView.addSubview(restaurantName)
        restaurantName.snp.makeConstraints { make in
            make.top.equalTo(restaurantImageView.snp.top)
            make.leading.equalTo(restaurantImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(kitchensInfo)
        kitchensInfo.snp.makeConstraints { make in
            make.top.equalTo(restaurantName.snp.bottom).offset(10)
            make.leading.equalTo(restaurantImageView.snp.trailing).offset(10)
        }
        
        contentView.addSubview(restaurantInfo)
        
        restaurantInfo.snp.makeConstraints { make in
            make.top.equalTo(kitchensInfo.snp.bottom).offset(10)
            make.leading.equalTo(restaurantImageView.snp.trailing).offset(10)
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
