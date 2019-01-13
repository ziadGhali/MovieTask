//
//  Api.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

let BASE_URL = "https://api.themoviedb.org/3/"
let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500/"
let API_Key = "4d47869e0dbc39feba0c017c6de66c5d"

class Api {
    
    internal typealias completionHandler = (Bool, Error?,Any?) -> ()
    internal static var isConnected: Bool {
        return NetworkReachabilityManager(host: "www.apple.com")!.isReachable
    }
    static let language = "en-US"
    static let endPoint = "person/popular"
    static func GetPopular(_ Page: Int!,completionHandler:@escaping completionHandler){
        if isConnected {
            let url = BASE_URL + endPoint
            let param : Parameters = [
                "api_key":API_Key,
                "language": language,
                "page":Page
            ]
            request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let jsonValue = value as? [String:Any],let jsonResult = jsonValue["results"] as? [[String : Any]]{
                        let page = jsonValue["page"] as! Int
                        let total_pages = jsonValue["total_pages"] as? Int
                        if page <= total_pages! {
                            let resultModel = Mapper<PersonModel>().mapArray(JSONArray: jsonResult )
                            completionHandler(true,nil,resultModel as Any)
                        }else{
                            let error = NSError(domain:"", code:1, userInfo:[ NSLocalizedDescriptionKey: "No More Data"])
                            completionHandler(false,error,nil)
                        }
                    }
                case .failure(var error):
                    error = NSError(domain:"", code:2, userInfo:[ NSLocalizedDescriptionKey: "No data Found"])
                    completionHandler(false,error,nil)
                }
            }
        }else{
            let error = NSError(domain:"", code:3, userInfo:[ NSLocalizedDescriptionKey: "Network connection error"])
            completionHandler(false,error,nil)
        }
        
    }
}

