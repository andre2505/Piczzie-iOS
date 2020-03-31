//
//  ErrorNetwork.swift
//  piczzie
//
//  Created by Thomas on 28/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

enum ErrorNetwork: Error {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
}
