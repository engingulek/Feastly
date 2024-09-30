//
//  RestaurantDetailViewController.swift
//  RestaurantDetailModule
//
//  Created by Engin Gülek on 30.09.2024.
//

import UIKit
import SnapKit
import CommonKit
class RestaurantDetailViewController: UIViewController {
    private lazy var restaurantInfoView:UIView = RestaurantInfoUIView(frame: .infinite)

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        view.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(restaurantInfoView)
        restaurantInfoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(UIScreen.main.bounds.height / 5)
        }
    }
}



