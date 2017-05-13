import Foundation


public struct AWSBucket {
	public let region:String
	
	public let bucket:String
	
	public init(name:String, region:String) {
		bucket = name
		self.region = region
	}
	
	///include the leading "/" in the object name
	public func requestToGETObjectNamed(_ object:String, etag:String? = nil)->URLRequest? {
		
		guard let url = URL(string:"https://\(bucket).s3.amazonaws.com\(object)") else {
			//guard let url = URL(string:"https://examplebucket.s3.amazonaws.com/photos/photo1.jpg") else {
			return nil
		}
		var request = URLRequest(url: url)
		if let etag = etag {
			request.addValue(etag, forHTTPHeaderField: "If-None-Match")
		}
		return request
	}
	
	
	public func requestToDELETEObjectNamed(_ object:String)->URLRequest? {
		guard let url = URL(string:"https://\(bucket).s3.amazonaws.com\(object)") else {
			//guard let url = URL(string:"https://examplebucket.s3.amazonaws.com/photos/photo1.jpg") else {
			return nil
		}
		var request = URLRequest(url: url)
		request.httpMethod = "DELETE"
		return request
	}
	
}
