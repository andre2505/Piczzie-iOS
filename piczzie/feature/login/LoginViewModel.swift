//
//  LoginViewModel.swift
//  piczzie
//
//  Created by Thomas on 19/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    
    @Published var user = User()
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
        user.email = ""
    }
    
    func login(email: String, password: String){
        
        user.email = email
        user.password = password
        
        UserRepository.login(user: self.user)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("GET - DONE")
            }
        }, receiveValue: { user in
            self.user = user
            setToken(token: user.token)
            setRefreshToken(refreshToken: user.refreshToken)
            setUser(user: user)
            })
            .store(in: &disposables)
    }
    
}
