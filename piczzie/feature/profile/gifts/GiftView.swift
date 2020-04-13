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
    
    @EnvironmentObject var giftVM: GiftViewModel
    
    @State var isActive: Bool = false
    
    @State var isLoadFirst: Bool = false
    
    @State var firstLoading : Bool = true
    
    @State var firstAppear: Bool = true
    
    var body: some View {
        VStack {
            GridView(giftVM,
                         columns: 3,
                         vSpacing: 1,
                         hSpacing: 1,
                         vPadding: 0,
                         hPadding: 0) { (gift: Gift) in
                            NavigationLink(destination: FriendsView()) {
                                WebImage(url: URL(string: gift.image ?? ""))
                                    .resizable()
                                    .placeholder  {
                                        Rectangle().foregroundColor(Color("colorGrey"))
                                }
                                .scaledToFit()
                            }.buttonStyle(PlainButtonStyle())
                }.navigationBarTitle("profil", displayMode: .inline)
            }.background(Color.white)
            .buttonStyle(PlainButtonStyle())
            .onAppear{
                if(self.firstAppear){
                    self.giftVM.getGifts(userId: getUser()?.id, offset: 0)
                    self.firstAppear = false
                }
        }
    }
}

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
