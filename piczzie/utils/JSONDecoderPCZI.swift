//
//  JSONDecoderPCZI.swift
//  piczzie
//
//  Created by Thomas on 31/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

open class JSONDecoderPCZI: JSONDecoder{
        
    static func decodePCZI() -> JSONDecoder{
        let formatter = DateFormatter()
        let decode = JSONDecoder()
        formatter.calendar = Calendar(identifier: .iso8601)
        
        decode.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)

            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            if let date = formatter.date(from: dateStr) {
                return date
            }
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
            if let date = formatter.date(from: dateStr) {
                return date
            }
            return Date()
        })
        
        return decode
    }
    
}
