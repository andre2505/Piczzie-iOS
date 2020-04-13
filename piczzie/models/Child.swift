//
//  Child.swift
//  piczzie
//
//  Created by Thomas on 08/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

struct Child: Codable, Identifiable {
    
    var uuid = UUID()
    var id: String? = nil
    var firstname: String? = nil
    var lastname: String? = nil
    var gender: Int? = nil
    var birthday: Date? = nil
    var parent: User? = nil
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case firstname = "firstname"
        case lastname = "lastname"
        case gender = "gender"
        case birthday = "birthday"
        case parent = "parent"
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(firstname, forKey: .firstname)
        try container.encodeIfPresent(lastname, forKey: .lastname)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(birthday, forKey: .birthday)
        try container.encodeIfPresent(parent, forKey: .parent)
        
    }
    
    func decode(to decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try container.decode(Int.self, forKey: .id)
        try container.decode(String.self, forKey: .firstname)
        try container.decode(String.self, forKey: .lastname)
        try container.decode(Int.self, forKey: .gender)
        try container.decode(Date.self, forKey: .birthday)
        try container.decode(User.self, forKey: .parent)
    }
    
    
}
