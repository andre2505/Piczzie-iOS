//
//  UserRepository.swift
//  piczzie
//
//  Created by Thomas on 30/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation
import Combine

class UserRepository {
    
    static func login(user: User) -> AnyPublisher<User, Error> {
        return try! post(url: UserRouter.login, path:nil,  body: user)
            .tryMap{ try validate($0.data, $0.response) }
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func getUserInformation(id: String) ->AnyPublisher<User, Error> {
        return try! get(url: UserRouter.userInformation, path: ["id" : id])
            .tryMap{ try validate($0.data, $0.response) }
            .decode(type: User.self, decoder: JSONDecoderPCZI.decodePCZI())
            .eraseToAnyPublisher()
    }
    
    static func getFriendsList(id: String) ->AnyPublisher<[User], Error> {
        return try! get(url: UserRouter.getFriends, path: ["id" : id])
            .tryMap{ try validate($0.data, $0.response) }
            .decode(type: [User].self, decoder: JSONDecoderPCZI.decodePCZI())
            .eraseToAnyPublisher()
    }
}
