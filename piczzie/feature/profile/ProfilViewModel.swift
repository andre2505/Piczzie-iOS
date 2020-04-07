//
//  ProfilViewModel.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation
import Combine

class ProfilViewModel : ObservableObject {
    
    @Published var user = User()
    
    private var disposables = Set<AnyCancellable>()
    
    func getUserInformations(userId: String?){
        UserRepository.getUserInformation(id: userId!)
        .receive(on: DispatchQueue.main)
                 .sink(receiveCompletion: { (completion) in
                 switch completion {
                 case .failure(let error):
                     print(error)
                 case .finished:
                     print("GET - DONE PROFIL")
                 }
               
             }, receiveValue: { user in
                self.user = user
             })
        .store(in: &disposables)
    }
    
}
