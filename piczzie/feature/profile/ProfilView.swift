//
//  ProfilView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import WaterfallGrid
import SDWebImageSwiftUI

struct ProfilView: View {
    
    @ObservedObject var profilVM = ProfilViewModel()
    
    @State var favoriteIsSelected : Bool = true
    
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
                        
                        self.favoriteIsSelected = false
                    }) {
                        (favoriteIsSelected) ? Image("FavoriteSelected")
                            .foregroundColor(Color.red)
                            .frame(maxWidth: .infinity) :  Image("FavoriteNotSelected")
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity)
                    }
                    
                    Button(action: {
                        self.favoriteIsSelected = true
                        
                    }) {
                        
                        (favoriteIsSelected) ? Image("FavoriteSelected")
                        .foregroundColor(Color.red)
                        .frame(maxWidth: .infinity) :  Image("FavoriteNotSelected")
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity)
                    }
                    
                }.padding(18)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.white)
                
                Divider().frame(height: 0.5).background(Color("colorGrey10"))
                
                VStack {
                    
                    WaterfallGrid(profilVM) { (gift: Gift) in
                        
                        WebImage(url: URL(string: "http://192.168.1.51:8080/uploads/5c447f1d19c08bbdd4373353/profil/telechargement.png"))
                            .resizable()
                            .placeholder  {
                                Rectangle().foregroundColor(Color.gray)
                        }
                        .scaledToFit()
                        .onAppear {
                            self.profilVM.loadMore(currentItem: gift)
                        }
                    }.gridStyle(columns: 3)
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment:.top)
                .background(Color.white)
                .navigationBarTitle("profil", displayMode: .inline)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
    }
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
    
}
