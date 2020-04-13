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
    
    @EnvironmentObject var profilVM : ProfilViewModel
    
    @Environment (\.presentationMode) var presentationMode
    
    @Binding var showMenu: Bool
    
    @State var giftIsSelected : Bool = true
    
    @State var navigagtionAppear : Bool = true
    
    @State var heighGiftView : CGFloat = 0
    
    @State var firstAppear: Bool = true
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing:0) {
                    
                    ProfileDescriptionView()
                    
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    
                    RelationshipView()
                    
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
                        }.buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            self.giftIsSelected = false
                        }) {
                            
                            (self.giftIsSelected) ? Image("FavoriteNotSelected")
                                .foregroundColor(Color.gray)
                                .frame(maxWidth: .infinity) :  Image("FavoriteSelected")
                                    .foregroundColor(Color("colorPink"))
                                    .frame(maxWidth: .infinity)
                        }.buttonStyle(PlainButtonStyle())
                        
                    }.padding(14)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.white)
                    
                    Divider().frame(height: 0.5).background(Color("colorGrey10"))
                    
                    
                    GiftView().opacity((self.giftIsSelected) ? 1:0).frame(minHeight: 0, maxHeight: (self.giftIsSelected) ? .infinity : 0).environmentObject(profilVM)
                    
                    FavoriteView().opacity((self.giftIsSelected) ? 0:1).frame(minHeight: 0, maxHeight: (self.giftIsSelected) ? 0 : .infinity)
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.white)
                    .navigationBarItems(trailing: Button(action:{
                        self.showMenu = true
                    }){
                        HStack {
                            Image("settings")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(maxWidth: 22, maxHeight: 22)
                        }
                    })
            }
        }.onAppear {
            self.profilVM.getUserInformations(userId: getUser()?.id)
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct ProfileDescriptionView: View {
    
    @EnvironmentObject var profilVM : ProfilViewModel
    
    private static let formatter = DateFormatter()
    
    init(){
        ProfileDescriptionView.formatter.dateStyle = .long
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer().frame(height: 10)
            
            WebImage(url: URL(string: "http://192.168.1.51:8080/\(getUser()?.photo ?? "")"))
                .resizable()
                .placeholder  {
                    ZStack {
                        Rectangle().foregroundColor(.white)
                        Image("profile.man")
                            .resizable()
                            .foregroundColor(Color("colorGrey"))
                    }
            }
            .clipShape(Circle())
            .shadow(radius: 5)
            .overlay(Circle()
            .stroke(Color.white, lineWidth: 2))
            .frame(width: 100, height: 100)
            .scaledToFit()
            
            Spacer().frame(height: 5)
            
            Text("\(self.profilVM.user.lastname ?? "") \(self.profilVM.user.firstname ?? "")")
                .font(.custom("Helvetica Bold", size: 16))
            HStack {
                Text("\(ProfileDescriptionView.formatter.string(from: self.profilVM.user.birthday ?? Date()) )")
            }
        }.padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("colorGrey10"))
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(showMenu: .constant(false))
    }
    
}


