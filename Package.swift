// swift-tools-version:5.6
import PackageDescription
let package = Package(
	name: "SwiftAWSS3"
	,platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
		.watchOS(.v6),
		.tvOS(.v13),
	]
	,products: [
		.library(
			name: "SwiftAWSS3",
			targets: ["SwiftAWSS3"]),
		]
	,dependencies:[
		.package(url:"https://github.com/benspratling4/SwiftAWSSignatureV4.git", from:"3.0.1")
		,.package(url:"https://github.com/benspratling4/SwiftPatterns.git", from:"4.3.0")
	]
	,targets:[
		.target(
			name: "SwiftAWSS3",
			dependencies: ["SwiftAWSSignatureV4", "SwiftPatterns"]),
	  .testTarget(
		name: "SwiftAWSS3Tests",
		dependencies: ["SwiftAWSS3"]),
	  ]
	,swiftLanguageVersions:[.v5]
)
