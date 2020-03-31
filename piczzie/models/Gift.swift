//
//  Gift.swift
//  piczzie
//
//  Created by Thomas on 30/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

struct Gift: Codable, Identifiable{
    
    var id: String?
    var description: String?
    var price: Double?
    var place: String?
    var website: String?
    var date: Date?
    var image: String?
    var user: User?
    var userReserved: User?
    var userRequest: String?
    let decoder = JSONDecoder()
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description = "description"
        case price = "price"
        case place = "place"
        case website = "website"
        case date = "date"
        case image = "image"
        case user = "user_id"
        case userRequest = "user_request"
        case userReserved = "user_reserved"
       }
       
       func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(place, forKey: .place)
        try container.encodeIfPresent(website, forKey: .website)
        try container.encodeIfPresent(date, forKey: .date)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(user, forKey: .user)
        try container.encodeIfPresent(userRequest, forKey: .userRequest)
        try container.encodeIfPresent(userReserved, forKey: .userReserved)
       }
       
       func decode(to decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try container.decode(String.self, forKey: .id)
        try container.decode(String.self, forKey: .description)
        try container.decode(Double.self, forKey: .price)
        try container.decode(String.self, forKey: .place)
        try container.decode(String.self, forKey: .website)
        try container.decode(Date.self, forKey: .date)
        try container.decode(String.self, forKey: .image)
        try container.decode(User.self, forKey: .user)
        try container.decode(String.self, forKey: .userRequest)
        try container.decode(User.self, forKey: .userReserved)
           
       }
}
