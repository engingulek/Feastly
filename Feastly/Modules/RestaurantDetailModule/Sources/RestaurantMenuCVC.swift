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
    private lazy var menuInfoLabel = UILabel.secondaryCellTitleUILabel(alignment: .left)
    private lazy var priceMenuLabel = UILabel.cellTitleBoldUILabel(alignment: .left)
    private lazy var addCartButton = UIButton.primaryButton(text: "+")
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        menuNameLabel.text = "Menu Name"
        menuInfoLabel.text = "Sdcn slaasmdsamm kdkaı okoakeomo okakenlakp omamen a*kkale-nınoonfaeknnaırnnda"
        priceMenuLabel.text = "130tl"
        let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTSrUZxUu_PkBzk38fScQppdPhSxjdCpwpHg&s")
        menuimage.kf.setImage(with: url)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
