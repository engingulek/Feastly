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


//MARK: - SegueAble
public protocol SegueAble {
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
    func popViewControllerAble()
}

extension SegueAble  where Self : UIViewController{
    public func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    public func popViewControllerAble(){
        navigationController?.popViewController(animated: true)
    }
}


//MARK: - NavConUIAble
public protocol NavConUIAble {
    func changeTitle(title:String)
}


extension NavConUIAble where Self :  UIViewController{
    
    public func changeTitle(title:String) {
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = UIColor(hex: ColorTheme.secondaryLabelColor.rawValue)
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor(
            hex: ColorTheme.secondaryLabelColor.rawValue) ?? .orange
        ]
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
