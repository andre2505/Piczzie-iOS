//
//  GiftRouter.swift
//  piczzie
//
//  Created by Thomas on 30/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

enum GiftRouter : Router {
   
    //GET method
    case getGiftUser(userId: String)
    case getFavoriteGiftUser
    
    var path: String {
      switch self {
      case .getGiftUser:
        return "/api/gift/user/{id}"
      case .getFavoriteGiftUser:
        return "/api/gift/reservation"
      }
    }
}
