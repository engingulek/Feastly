//
//  AppDelegate.swift
//  Feastly
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let view = ViewController()
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        return true
    }

    
}
