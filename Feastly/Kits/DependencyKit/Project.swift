//
//  Project.swift
//  Config
//
//  Created by Engin Gülek on 27.09.2024.
//

import Foundation
import ProjectDescription

let staticfFramwork = Project (
    name: "DependencyKit",
    targets: [
        .target(name: "DependencyKit",
                destinations: .iOS,
                product: .staticFramework,
                bundleId: "com.ios.DependencyKit",
                infoPlist: .default,
                sources: "Sources/**",
                dependencies: []
               ),
    ]
)
