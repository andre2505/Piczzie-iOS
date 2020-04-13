//
//  ChildRepository.swift
//  piczzie
//
//  Created by Thomas on 08/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation
import Combine

class ChildRepository {
    
    static func getChildren(userId: String) -> AnyPublisher<[Child], Error> {
        return try! get(url: ChildRouter.getChildren, path:["id": userId])
            .tryMap{ try validate($0.data, $0.response) }
            .decode(type: [Child].self, decoder: JSONDecoderPCZI.decodePCZI())
            .eraseToAnyPublisher()
    }
}
