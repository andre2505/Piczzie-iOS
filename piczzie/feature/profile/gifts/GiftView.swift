//
//  GiftView.swift
//  piczzie
//
//  Created by Thomas on 02/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import QGrid

struct GiftView: View {
    
    @ObservedObject var giftVM = GiftViewModel()
    
    @State var showMenu: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            QGrid(giftVM,
                  columns: 3,
                  vSpacing: 1,
                  hSpacing: 1,
                  vPadding: 0,
                  hPadding: 0) { (gift: Gift) in
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
            }.navigationBarTitle("profil", displayMode: .inline)
        }.background(Color.white)
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
