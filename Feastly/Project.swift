import ProjectDescription

let project = Project(
    name: "Feastly",
    targets: [
        .target(
            name: "Feastly",
            destinations: .iOS,
            product: .app,
            bundleId: "io.com.app",
            infoPlist: .extendingDefault(with: ["UILaunchStoryboardName": "LaunchScreen"]),
            sources: ["Feastly/Sources/**"],
            resources: ["Feastly/Resources/**"],
            dependencies: [
                .project(target: "DependencyKit", path: .relativeToRoot("Kits/DependencyKit")),
                .project(target: "HomeModule", path: .relativeToRoot("Modules/HomeModule")),
                .project(target: "AllKitchensModule", path: .relativeToRoot("Modules/AllKitchensModule")),
                .project(target: "FilterRestaurnatListModule", path: .relativeToRoot("Modules/FilterRestaurnatListModule")),
                .project(target: "RestaurantDetailModule", path: .relativeToRoot("Modules/RestaurantDetailModule")),
               
                
                    
            ]
        ),
    ]
)
