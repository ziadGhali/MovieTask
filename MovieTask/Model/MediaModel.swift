//
//  MediaModel.swift
//  MovieTask
//
//  Created by ziad ghali on 1/12/19.
//  Copyright © 2019 ziad ghali. All rights reserved.
//

import Foundation
import ObjectMapper

struct MediaModel: Mappable {
    
    var vote_average:CGFloat!
    var vote_count:Int!
    var id:Int!
    var video:Bool!
    var media_type: String!
    var title: String!
    var popularity: Double!
    var poster_path: String!
    var original_language: String!
    var original_title: String!
    var genre_ids:[Int]!
    var backdrop_path: String!
    var adult: Bool!
    var overview: String!
    var release_date: String!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
        id <- map["id"]
        video <- map["video"]
        media_type <- map["media_type"]
        title <- map["title"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        original_title <- map["original_title"]
        original_language <- map["original_language"]
        genre_ids <- map["genre_ids"]
        backdrop_path <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        release_date <- map["release_date"]
    }
    
    
}
