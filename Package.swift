import PackageDescription

let package = Package(
    name: "LogMiddleware",
    dependencies: [
        .Package(url: "https://github.com/Zewo/HTTP.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/Zewo/Log.git", majorVersion: 0, minor: 5),
    ]
)
