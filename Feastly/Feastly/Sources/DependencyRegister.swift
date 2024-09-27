//
//  DependencyRegister.swift
//  Feastly
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import HomeModule
import HomeModuleProtocol
import DependencyKit
final class DependencyRegister {
    func registerDependecies(){
        let dependencyEngine = DependencyEngine.shared
        dependencyEngine.register(value: HomeRouter(), for: HomeModuleProtocol.self)
    }
}
