import Foundation
import SwiftAWSSignatureV4

public struct AWSBucket {
	public let region:String
	
	public let bucket:String
	
	public let server:String
	
	public static let amazonServer:String = "s3.amazonaws.com"
	public static let ibmPublicServer:String = "objectstorage.softlayer.net"
	public static let ibmPrivateServer:String = "objectstorage.service.networklayer.com"
	
	public var placeBucketInDomain:Bool = true
	
	public init(name:String, region:String, server:String = AWSBucket.amazonServer) {
		bucket = name
		self.region = region
		self.server = server
		if name.contains(".") {
			placeBucketInDomain = false
		}
	}
	
	public func urlTo(_ object:String)->URL? {
		if placeBucketInDomain {
			guard let encodedName:String = object.aws_uriEncoded(encodeSlash: false) else { return nil }
			return URL(string:"https://\(bucket).\(server)\(encodedName)")
		} else {
			guard let encodedName:String = ("/" + bucket + object).aws_uriEncoded(encodeSlash: false) else { return nil }
			return URL(string:"https://\(server)\(encodedName)")
		}
	}
	
	///include the leading "/" in the object name
	public func requestToGETObjectNamed(_ object:String, etag:String? = nil)->URLRequest? {
		guard let url = urlTo(object) else {
		//,let url = URL(string:"https://\(server)/\(bucket)\(encodedName)") else {
			//guard let url = URL(string:"https://examplebucket.s3.amazonaws.com/photos/photo1.jpg") else {
			return nil
		}
		var request = URLRequest(url: url)
		request.httpBody = Data()
		if let etag = etag {
			request.addValue(etag, forHTTPHeaderField: "If-None-Match")
		}
		return request
	}
	
	
	public func requestToDELETEObjectNamed(_ object:String)->URLRequest? {
		guard let url = urlTo(object) else {
			//guard let url = URL(string:"https://examplebucket.s3.amazonaws.com/photos/photo1.jpg") else {
			return nil
		}
		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		return request
	}
	
	
	public func requestToListObjects(prefix:String? = nil, marker:String? = nil)->URLRequest? {
		// http://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketGET.html
		guard let startingUrl:URL = urlTo("/")
			,var components:URLComponents = URLComponents(url: startingUrl, resolvingAgainstBaseURL: false) else {
			return nil
		}
		components.queryItems = []
		if let prefix = prefix {
			components.queryItems?.append(URLQueryItem(name: "prefix", value: prefix))
		}
		if let marker = marker {
			components.queryItems?.append(URLQueryItem(name: "marker", value: marker))
		}
		//one day, add max-keys
		
		guard let url = components.url else {
			//guard let url = URL(string:"https://examplebucket.s3.amazonaws.com/photos/photo1.jpg") else {
			return nil
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.httpBody = Data()
		return request
	}
	
}
