//
//  FavoriteView.swift
//  piczzie
//
//  Created by Thomas on 02/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import WaterfallGrid
import SDWebImageSwiftUI

struct FavoriteView: View {
    
    @ObservedObject var favoriteVM = FavoriteViewModel()
    
    var body: some View {
        VStack {
            WaterfallGrid(favoriteVM) { (gift: Gift) in
                NavigationLink(destination: FriendsView()) {
                    WebImage(url: URL(string: "http://192.168.1.51:8080/uploads/5c447f1d19c08bbdd4373353/profil/telechargement.png"))
                        .resizable()
                        .placeholder  {
                            Rectangle().foregroundColor(Color.gray)
                    }
                    .scaledToFit()
                    .onAppear {
                        self.favoriteVM.loadMore(currentItem: gift)
                    }
                }.buttonStyle(PlainButtonStyle())
            }.gridStyle(columns: 3, spacing: 1)
                .navigationBarTitle("profil", displayMode: .inline)
        }.background(Color.white)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
