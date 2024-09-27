//
//  UICollectionView+Extension.swift
//  CommonKit
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit

extension UICollectionView {
    public static func primaryCollectionView(tag:Int,scroolDirection:UICollectionView.ScrollDirection) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       layout.scrollDirection = scroolDirection
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(hex: ColorTheme.primaryBackColor.rawValue)
        collectionView.tag = tag
        return collectionView
    }
}
