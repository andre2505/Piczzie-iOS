//
//  ProfilView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfilView: View {
    
    @ObservedObject var profilVM = ProfilViewModel()
    
    @State var giftIsSelected : Bool = true
    
    @Binding var showMenu: Bool
    
    var giftView = GiftView()
    
    var favoriteView = FavoriteView()
    
    var body: some View {
            NavigationView {
                VStack(spacing:0) {
                    VStack {
                        //IMAGE
                        WebImage(url: URL(string: "http://192.168.1.51:8080/uploads/5c447f1d19c08bbdd4373353/profil/telechargement.png"))
                            .resizable()
                            .placeholder  {
                                Rectangle().foregroundColor(Color.gray)
                        }
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .frame(width: 100, height: 100)
                        .scaledToFit()
                        
                        Text("profil")
                    }.padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color("colorGrey10"))
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    HStack {
                        Button(action: {
                            /*let swiftUI = LoginView()
                             UIApplication.shared.keyWindow!.rootViewController = UIHostingController(rootView: swiftUI)*/
                            self.giftIsSelected = true
                        }) {
                            (self.giftIsSelected) ? Image("GiftSelected")
                                .foregroundColor(Color("colorPink"))
                                .frame(maxWidth: .infinity) :  Image("GiftUnselected")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity)
                        }
                        
                        Button(action: {
                            self.giftIsSelected = false
                        }) {
                            
                            (self.giftIsSelected) ? Image("FavoriteNotSelected")
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity) :  Image("FavoriteSelected")
                                    .foregroundColor(Color("colorPink"))
                                    .frame(maxWidth: .infinity)
                        }
                        
                    }.padding(14)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.white)
                    
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    
                    if(self.giftIsSelected) {
                        getGiftView()
                    } else {
                        getFavoriteView()
                    }
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment:.top)
                    .background(Color.white)
                    .navigationBarItems(trailing: Button(action:{
                        self.showMenu = true
                    }){
                        HStack {
                            Image("settings")
                                .foregroundColor(Color.white)
                        }
                    })
            }
        
    }
    
    private func getGiftView() -> GiftView {
        return giftView
    }
    
    private func getFavoriteView() -> FavoriteView {
        return favoriteView
    }
    
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(showMenu: .constant(false))
    }
    
}

