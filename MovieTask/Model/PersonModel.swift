//
//  PersonModel.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import Foundation
import ObjectMapper

struct PersonModel: Mappable {
    var id: Int!
    var knownFor :[MediaModel]!
    var name: String!
    var popularity: String!
    var profilePath: String!
    var adult: Bool!

    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        knownFor <- map["known_for"]
        name <- map["name"]
        popularity <- map["popularity"]
        profilePath <- map["profile_path"]
        adult <- map["adult"]
    }
    
    
}
