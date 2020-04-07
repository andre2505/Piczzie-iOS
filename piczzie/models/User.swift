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
    var gender: Int?
    var password: String?
    var email : String?
    var birthday: Date?
    var photo: String?
    var friends: [User]?
    var state: Int?
    var friendsId: String?
    var token: String?
    var refreshToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstname = "firstname"
        case lastname = "lastname"
        case gender = "gender"
        case password = "password"
        case email = "email"
        case birthday = "birthday"
        case photo = "photo"
        case friends = "friends"
        case state = "state"
        case friendsId = "friends_id"
        case token = "token"
        case refreshToken = "refresh_token"
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(firstname, forKey: .firstname)
        try container.encodeIfPresent(lastname, forKey: .lastname)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(birthday, forKey: .birthday)
        try container.encodeIfPresent(photo, forKey: .photo)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(friends, forKey: .friends)
        try container.encodeIfPresent(state, forKey: .state)
        try container.encodeIfPresent(friendsId, forKey: .friendsId)
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
        try container.decode(String.self, forKey: .token)
        try container.decode(String.self, forKey: .refreshToken)
        
    }
    
}
