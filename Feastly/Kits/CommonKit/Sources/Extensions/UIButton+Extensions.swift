//
//  UIButton+Extensions.swift
//  CommonKit
//
//  Created by Engin Gülek on 29.09.2024.
//

import Foundation
import UIKit

extension UIButton {
    public static func textButton(text:String) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor(hex: ColorTheme.secondaryLabelColor.rawValue), for: .normal)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }
    
    
    public static func primaryButton(text:String) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor(hex: ColorTheme.secondaryBackColor.rawValue), for: .normal)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(hex: ColorTheme.secondaryLabelColor.rawValue)
        button.layer.cornerRadius = 10
        return button
    }
}
