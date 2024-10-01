//
//  RestaurantInfoUIView.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import UIKit
import SnapKit
import Kingfisher
import CommonKit
import CoreLocation
class RestaurantInfoUIView: UIView {
    private lazy var restaurantImage : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var restaurantName = UILabel.cellTitleBoldUILabel()
    private lazy var subInfo = UILabel.secondaryCellTitleUILabel()
    private lazy var serviceLabel = UILabel.cellTitleBoldUILabel()
    private lazy var flavorLabel =  UILabel.cellTitleBoldUILabel()
    private lazy var servicePoint = UILabel.cellTitleUILabel()
    private lazy var flavorPoint = UILabel.cellTitleUILabel()
    
    private lazy var minWageTitleLabel =  UILabel.cellTitleBoldUILabel()
    private lazy var minWageLabel =  UILabel.secondaryCellTitleUILabel()
    
    private lazy var workingHoursTitleLabel =  UILabel.cellTitleBoldUILabel()
    private lazy var workingHoursLabel =  UILabel.secondaryCellTitleUILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        backgroundColor = .white
        layer.cornerRadius = 10
       
        serviceLabel.text = "Service:"
        flavorLabel.text = "Flavor:"
        minWageTitleLabel.text = "Min Wage"
    }
    
    func configureData(detail:RestaurantDetail){
        
        let url = URL(string: detail.imageURL)
        restaurantImage.kf.setImage(with: url)
        restaurantName.text = detail.name
        servicePoint.text = "\(detail.service)"
        flavorPoint.text = "\(detail.flavor)"
        let restaurantLocation = CLLocation(latitude: detail.latitude, longitude: detail.longitude)
        let kitches = detail.kitchens.map { $0.name }.joined(separator:", ")
        let userLocation = CLLocation(latitude: 41.09732, longitude: 29.03126)
        let km = restaurantLocation.distance(from: userLocation) / 1000
        subInfo.text = "\(String(format: "%.2f", km)) * \(kitches)"
        minWageLabel.text = "\(detail.minWage)TL"
    }
    
    private func configureUI(){
        addSubview(restaurantImage)
        restaurantImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        addSubview(restaurantName)
        restaurantName.snp.makeConstraints { make in
            make.top.equalTo(restaurantImage.snp.top)
            make.leading.equalTo(restaurantImage.snp.trailing).offset(10)
        }
        addSubview(subInfo)
        subInfo.snp.makeConstraints { make in
            make.top.equalTo(restaurantName.snp.bottom).offset(5)
            make.leading.equalTo(restaurantImage.snp.trailing).offset(10)
        }
        
        addSubview(serviceLabel)
        serviceLabel.snp.makeConstraints { make in
            make.top.equalTo(subInfo.snp.bottom).offset(5)
            make.leading.equalTo(restaurantImage.snp.trailing).offset(10)
        }
        
        addSubview(servicePoint)
        servicePoint.snp.makeConstraints { make in
            make.top.equalTo(serviceLabel.snp.top)
            make.leading.equalTo(serviceLabel.snp.trailing)
        }
        
        addSubview(flavorLabel)
        flavorLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceLabel.snp.bottom).offset(5)
            make.leading.equalTo(restaurantImage.snp.trailing).offset(10)
        }
        
        addSubview(flavorPoint)
        flavorPoint.snp.makeConstraints { make in
            make.top.equalTo(flavorLabel.snp.top)
            make.leading.equalTo(flavorLabel.snp.trailing)
        }
        
        addSubview(minWageTitleLabel)
        minWageTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(flavorLabel.snp.bottom).offset(15)
        }
        addSubview(minWageLabel)
        minWageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(minWageTitleLabel.snp.bottom).offset(5)
        }
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
