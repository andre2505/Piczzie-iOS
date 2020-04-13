//
//  FriendsViewModel.swift
//  piczzie
//
//  Created by Thomas on 12/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation

import Combine

class FriendsViewModel : ObservableObject {
    
    @Published var friendsList = [User]()
    
    private var disposables = Set<AnyCancellable>()
    
    func getUser(userId: String) {
        UserRepository.getFriendsList(id: userId)
               .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { (completion) in
                        switch completion {
                        case .failure(let error):
                            print(error)
                        case .finished:
                            print("GET - DONE FAVORITE")
                        }
                      
                    }, receiveValue: { friends in
                        self.friendsList = friends
                    })
               .store(in: &disposables)
    }
    
    
}
