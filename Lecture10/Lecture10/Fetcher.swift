//
//  Fetcher.swift
//  Lecture10
//
//  Created by Jamil Afza on 7/25/16.
//  Copyright © 2016 Jamil Afza. All rights reserved.
//

import Foundation

class Fetcher: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    
    func session() -> NSURLSession {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 15.0
        return NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    func URLSession(session: NSURLSession, didBecomeInvalidWithError error: NSError?) {
        NSLog("no")
    }
    
    func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession) {
        <#code#>
    }
    
    
    typealias RequestCompletionHandler = (data:NSData?, message: String?) -> Void
    
    func request(url: NSURL, completion: RequestCompletionHandler) {
        _ = session().dataTaskWithURL(url) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) in
            let message = self.parseResponse(response, error: error)
            completion(data: data, message: message)
        }
        
    }
    
    typealias JSONRequestCompletionHandler = (json:NSObject?, message: String?) -> void)
    
    func requestJSON(url: NSURL, completion: JSONRequestCompletionHandler)  {
        request(url) { (data, message) in
        var json: NSObject?
        if let data = data {
            json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
        }
            completion(json: json, message: message)
        }
    }
    
    
    func parseResponse(response: NSURLResponse?, error: NSError?) -> String? {
        if let statusCode = (response as? NSHTTPURLResponse)?.statusCode {
            if statusCode == 200 {
                return nil
            }
            else {
                return "http error"
            }
        }
        else {
            if let netErr = error {
                return "Network Error:"
            }
            else {
                return "OS Error"
            }
        }
    }
    
}