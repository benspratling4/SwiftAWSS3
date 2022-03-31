// swift-tools-version:5.0
import PackageDescription
let package = Package(
	name: "SwiftAWSS3"
	,platforms: [
        .macOS(.v10_11)
	]
	,products: [
		.library(
			name: "SwiftAWSS3",
			targets: ["SwiftAWSS3"]),
		]
	,dependencies:[
		.package(url:"https://github.com/benspratling4/SwiftAWSSignatureV4.git", from:"2.0.0")
		,.package(url:"https://github.com/benspratling4/SwiftPatterns.git", from:"3.0.0")
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
