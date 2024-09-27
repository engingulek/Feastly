//
//  AppDelegate.swift
//  Feastly
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import UIKit
import DependencyKit
import HomeModuleProtocol
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let dependencyRegister = DependencyRegister()
        dependencyRegister.registerDependecies()
        @Dependency var homeModuleProtocol : HomeModuleProtocol
        let view = homeModuleProtocol.createHomeViewController()
        window?.rootViewController =  view
        window?.makeKeyAndVisible()
        return true
    }

    
}
