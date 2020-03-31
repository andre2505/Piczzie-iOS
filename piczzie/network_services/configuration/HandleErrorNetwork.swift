//
//  HandleErrorNetwork.swift
//  piczzie
//
//  Created by Thomas on 27/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

class HandleErrorNetwork {
    public static func handleCodeStatut(statusCode: Int) -> ErrorNetwork? {
        switch statusCode {
        case 401,
             403:
            return .invalidResponse
        default:
            return nil
        }
    }
}
