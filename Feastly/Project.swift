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
            dependencies: []
        ),
    ]
)
