//
//  ProfilViewModel.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import Foundation
import Combine

class FavoriteViewModel : ObservableObject, RandomAccessCollection {
    
    typealias Element = Gift

    @Published var giftList = [Gift]()
    
    private var disposables = Set<AnyCancellable>()
    
    var startIndex: Int {giftList.startIndex}
    var endIndex: Int {giftList.endIndex}
   
    var currentLoading = false
    
    subscript(position: Int) -> Gift {
        return giftList[position]
    }
    
    func getFavoriteGifts(){
        
        GiftRepository.getFavoriteUserGift()
        .receive(on: DispatchQueue.main)
                 .sink(receiveCompletion: { (completion) in
                 switch completion {
                 case .failure(let error):
                     print(error)
                 case .finished:
                     print("GET - DONE FAVORITE")
                 }
                self.currentLoading = false
             }, receiveValue: { gift in
                self.giftList.append(contentsOf: gift)
                self.currentLoading = false
             })
        .store(in: &disposables)
    }
    
    func loadMore(currentItem: Gift?) {
        if !shouldLoadMoreGifts(currentItem: currentItem!) {
            return
        }
        
        currentLoading = true
        
        getFavoriteGifts()
    }
    
    func shouldLoadMoreGifts(currentItem:Gift?) -> Bool {
        if currentLoading {
            return false
        }
        
        guard let currentItem = currentItem else {
            return true
        }
        
        guard let lastItem = giftList.last else {
            return true
        }
        
        return currentItem.id == lastItem.id
        
    }
}
