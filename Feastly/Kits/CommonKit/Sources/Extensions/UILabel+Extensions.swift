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
    
    public static func secondarytitleUILabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        return label
    }
    
    
    public static func cellTitleUILabel() -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
        label.textAlignment = .center
        return label
    }

    
    public static func secondaryCellTitleUILabel(alignment:NSTextAlignment = .center,numberOfLines:Int = .zero) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        return label
    }
    
    public static func cellTitleBoldUILabel(alignment:NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.backgroundColor = UIColor(hex: ColorTheme.secondaryBackColor.rawValue)
        label.textAlignment = alignment
        return label
    }
}
