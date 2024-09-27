//
//  Project.swift
//  Config
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import ProjectDescription

let homeModule = Project (
    name: "HomeModule",
    targets: [
        .target(name: "HomeModule",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.HomeModule",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: [
                    .project(target: "HomeModuleProtocol", path: .relativeToRoot("Modules/HomeModule")),
                    
                ]
                
               ),
        .target(name:"HomeModuleProtocol",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.HomeModuleProtocol",
                sources: "ProtocolSource/**"
                
               )
    ]
)
