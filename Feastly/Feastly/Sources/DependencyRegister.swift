//
//  DependencyRegister.swift
//  Feastly
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import HomeModule
import HomeModuleProtocol
import AllKitchensModule
import AllKitchensModuleProtocol
import FilterRestaurnatListModule
import FilterRestaurnatListModuleProtocol
import RestaurantDetailModuleProtocol
import RestaurantDetailModule
import DependencyKit
final class DependencyRegister {
    func registerDependecies(){
        let dependencyEngine = DependencyEngine.shared
        
        dependencyEngine.register(value: HomeRouter(), for: HomeModuleProtocol.self)
        dependencyEngine.register(value: AllKitchensRouter(), for: AllKitchensModuleProtocol.self)
        dependencyEngine.register(value: FilterRestaurnatListRouter(), for: FilterRestaurnatListModuleProtocol.self)
        dependencyEngine.register(value: RestaurantDetailRouter(), for: RestaurantDetailModuleProtocol.self)
    }
}
