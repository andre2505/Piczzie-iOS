//
//  User.swift
//  piczzie
//
//  Created by Thomas on 29/01/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

struct User: Codable{
    
    var id: String?
    var firstname : String?
    var lastname: String?
    var password: String?
    var email : String?
    var photo: String?
    var token: String?
    var refreshToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstname = "firstname"
        case lastname = "lastname"
        case password = "password"
        case email = "email"
        case photo = "photo"
        case token = "token"
        case refreshToken = "refresh_token"
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(firstname, forKey: .firstname)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(token, forKey: .token)
        try container.encodeIfPresent(refreshToken, forKey: .refreshToken)
    }
    
    func decode(to decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try container.decode(Int.self, forKey: .id)
        try container.decode(String.self, forKey: .firstname)
        try container.decode(String.self, forKey: .email)
        try container.decode(String.self, forKey: .photo)
        try container.decode(String.self, forKey: .password)
        try container.decode(String.self, forKey:.token)
        try container.decode(String.self, forKey: .refreshToken)
        
    }
    
}
