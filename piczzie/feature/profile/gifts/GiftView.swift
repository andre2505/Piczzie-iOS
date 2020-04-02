//
//  GiftView.swift
//  piczzie
//
//  Created by Thomas on 02/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import WaterfallGrid
import SDWebImageSwiftUI

struct GiftView: View {
    
    @ObservedObject var profilVM = ProfilViewModel()
    
    var body: some View {
        VStack {
            WaterfallGrid(profilVM) { (gift: Gift) in
                NavigationLink(destination: FriendsView()) {
                    WebImage(url: URL(string: "http://192.168.1.51:8080/uploads/5c447f1d19c08bbdd4373353/profil/telechargement.png"))
                        .resizable()
                        .placeholder  {
                            Rectangle().foregroundColor(Color.gray)
                    }
                    .scaledToFit()
                    .onAppear {
                        self.profilVM.loadMore(currentItem: gift)
                    }
                }.buttonStyle(PlainButtonStyle())
            }.gridStyle(columns: 3, spacing: 1)
                .navigationBarTitle("profil", displayMode: .inline)
        }.background(Color.white)
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
