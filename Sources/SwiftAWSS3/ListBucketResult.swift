//
//  ListBucketResult.swift
//  Cryptor
//
//  Created by Ben Spratling on 10/21/17.
//

import Foundation
import SwiftPatterns


extension SwiftPatterns.XMLItem {
	
	var childString:String? {
		let stringChildren:[String] = children.flatMap { return $0 as? String }
		if stringChildren.count == 0 {
			return nil
		}
		return stringChildren.joined()
	}
	
}


public struct ListBucketResult {
	
	public var isTruncated:Bool
	
	public var prefix:String?
	
	public var marker:String?
	
	public var contents:[Content]
	
	public init(isTruncated:Bool, prefix:String?, marker:String?, contents:[Content]) {
		self.isTruncated = isTruncated
		self.prefix = prefix
		self.marker = marker
		self.contents = contents
	}
	
	public init?(xmlData:Data) {
		//get nodes
		guard let node = DataToXMLItemFactory(data: xmlData).documentItem?.children.first as? SwiftPatterns.XMLItem else {
			return nil
		}
		if node.name != "ListBucketResult" {
			 return nil
		}
		self.isTruncated = node.child(named: "IsTruncated")?.childString == "true"
		self.prefix = node.child(named: "Prefix")?.childString
		self.marker = node.child(named: "Marker")?.childString
		let (contentsNodes, _) = node.children(named: "Contents")
		self.contents = contentsNodes.flatMap({return Content(xml: $0)})
	}
	
	public struct Content {
		public var key:String
		public var size:Int
		public var lastModified:Date?
		//TODO: owner, etag...
		public init(key:String, size:Int, lastModified:Date?) {
			self.key = key
			self.size = size
			self.lastModified = lastModified
		}
		
		static let lastModifiedDateFormatter:DateFormatter = { ()->(DateFormatter) in
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'.'SSSZZZZZ"
			return formatter
		}()
		
		init?(xml:SwiftPatterns.XMLItem) {
			guard let keyChild:SwiftPatterns.XMLItem = xml.child(named: "Key")
				,let sizeString:String = xml.child(named: "Size")?.childString
				,let size:Int = Int(sizeString)
				else {
					return nil
			}
			let name:String = keyChild.childString ?? ""
			self.key = name
			self.size = size
			lastModified = (xml.child(named: "LastModified")?.childString).flatMap({return Content.lastModifiedDateFormatter.date(from:$0)})
		}
		
	}
	
}
