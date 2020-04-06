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
    
    @EnvironmentObject var giftVM:GiftViewModel
    
    @State var isActive: Bool = false
    
    @State var isLoadFirst: Bool = false
    
    @State var firstLoading : Bool = true
    
    @State var firstAppear: Bool = true
    
    var body: some View {
        VStack {
            GridView(giftVM.giftList,
                     columns: 3,
                     vSpacing: 1,
                     hSpacing: 1,
                     vPadding: 0,
                     hPadding: 0,
                     showScrollIndicators: true) { (gift: Gift) in
                        NavigationLink(destination: FriendsView()){
                            WebImage(url: URL(string: gift.image ?? ""))
                                .resizable()
                                .placeholder  {
                                    Rectangle().foregroundColor(Color("colorGrey10"))
                            }
                            .scaledToFit()
                            .onAppear {
                                self.giftVM.loadMore(currentItem: gift)
                            }
                        }.edgesIgnoringSafeArea(.top)
            }.navigationBarTitle("profile", displayMode: .inline)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
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
