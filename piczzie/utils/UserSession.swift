//
//  UserSession.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

let KEY_TOKEN = "key_token"
let KEY_REFRESH_TOKEN = "key_refresh_token"
let KEY_USER = "key_user"
    
func setToken(token:String?) {
        let preferences = UserDefaults.standard
        preferences.set(token, forKey: KEY_TOKEN)
    }
    
func setRefreshToken(refreshToken: String?){
        let preferences = UserDefaults.standard
        preferences.set(refreshToken, forKey: KEY_REFRESH_TOKEN)
    }

func setUser(user: User?) {
    let userEncoded = try? JSONEncoder().encode(user)
    let preferences = UserDefaults.standard
    preferences.set(userEncoded, forKey: KEY_USER)
    preferences.synchronize()
}

func getUser() -> User? {
    let preferences = UserDefaults.standard
    if preferences.data(forKey: KEY_USER) != nil {
        let user = preferences.data(forKey: KEY_USER)!
        return try? JSONDecoder().decode(User.self, from: user)
        } else {
         return nil
    }
}
    
func getToken() -> String? {
        let preferences = UserDefaults.standard
        if preferences.string(forKey: KEY_TOKEN) != nil {
                let access_token = preferences.string(forKey: KEY_TOKEN)
              return access_token!
            } else {
             return nil
        }
    }
    
func getRefreshToken() -> String? {
         let preferences = UserDefaults.standard
         if preferences.string(forKey: KEY_REFRESH_TOKEN) != nil {
                 let access_token = preferences.string(forKey: KEY_REFRESH_TOKEN)
               return access_token!
             } else {
              return nil
         }
     }


