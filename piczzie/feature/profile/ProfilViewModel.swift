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
    
    init() {
        //getUserInformations(userId: getUser()?.id, offset: 0)
    }
    
    
    func getUserInformations(userId: String?,offset:Int, currentItem:Gift? = nil){
        
        GiftRepository.getUserGift(id: userId ?? "", offset: offset)
        .receive(on: DispatchQueue.main)
                 .sink(receiveCompletion: { (completion) in
                 switch completion {
                 case .failure(let error):
                     print(error)
                 case .finished:
                     print("GET - DONE")
                 }
               
             }, receiveValue: { gift in
               
             })
        .store(in: &disposables)
    }
    
}
