//
//  CategoryCVC.swift
//  HomeModule
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher
import CommonKit
class KitchenCVC: UICollectionViewCell {
    static let identifier : String = "kitchenCVC"
    
    private lazy var kitchenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var kitchenLabel = UILabel.cellTitleUILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI(){
        contentView.addSubview(kitchenImageView)
        kitchenImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo( contentView.bounds.height / 2)
        }
        
        contentView.addSubview(kitchenLabel)
        kitchenLabel.snp.makeConstraints { make in
            make.top.equalTo(kitchenImageView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    
     func configureData(kitchen:Kitchen){
        let url = URL(string: kitchen.imageUrl)
        kitchenImageView.kf.setImage(with: url)
        kitchenLabel.text = kitchen.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
 
}
