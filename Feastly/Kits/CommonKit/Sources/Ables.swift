//
//  Ables.swift
//  CommonKit
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit

//MARK: - UIViewAble
public protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController  {
    public func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
    
}



//MARK: AlertMessageAble
public protocol AlertMessageAble {
    func createAlertMesssage(title:String,message:String,actionTitle:String)
   
}

extension AlertMessageAble  where Self : UIViewController {
    public  func createAlertMesssage(title:String,message:String,actionTitle:String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        self.present(alert, animated: true)
        
    }
}
