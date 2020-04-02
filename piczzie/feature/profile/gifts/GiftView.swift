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
    
    @ObservedObject var giftVM = GiftViewModel()
    
    var body: some View {
        VStack {
            WaterfallGrid(giftVM) { (gift: Gift) in
                NavigationLink(destination: FriendsView()) {
                    WebImage(url: URL(string: gift.image ?? ""))
                        .resizable()
                        .placeholder  {
                            Rectangle().foregroundColor(Color.gray)
                    }
                    .scaledToFit()
                    .onAppear {
                        self.giftVM.loadMore(currentItem: gift)
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
