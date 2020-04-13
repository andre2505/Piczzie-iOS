//
//  ChildRouter.swift
//  piczzie
//
//  Created by Thomas on 08/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

enum ChildRouter: Router {
    
    case getChildren
    
    var path: String {
        switch self {
        case .getChildren:
            return "/api/child/children/{id}"
        }
    }
}
