//
//  UILabel+Extensions.swift
//  CommonKit
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit
extension UILabel {
    public static func titleUILabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        label.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        return label
    }
}
