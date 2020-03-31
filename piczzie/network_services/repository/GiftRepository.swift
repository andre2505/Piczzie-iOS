//
//  GiftRepository.swift
//  piczzie
//
//  Created by Thomas on 30/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation
import Combine

class GiftRepository {
    
    static func getUserGift(id: String, offset: Int) -> AnyPublisher<[Gift], Error> {
        
        return try! get(url: GiftRouter.getGiftUser(userId: id), path: ["id" : id], queryParameter: [URLQueryItem(name: "offset", value: String(describing: offset))])
            .tryMap{ try validate($0.data, $0.response) }
            .decode(type: [Gift].self, decoder: JSONDecoderPCZI.decodePCZI())
            .eraseToAnyPublisher()
        }
    }


