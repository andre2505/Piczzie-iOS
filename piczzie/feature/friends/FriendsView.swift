//
//  FriendsView.swift
//  piczzie
//
//  Created by Thomas on 02/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendsView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @EnvironmentObject var profilVM: ProfilViewModel
    
    @ObservedObject var friendsVM = FriendsViewModel()
    
    @GestureState private var dragOffset = CGSize.zero
    
    init(){
        UITableView.appearance().separatorColor = .gray
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        
        VStack {
            List(self.friendsVM.friendsList){ (user :User) in
                NavigationLink(destination: EmptyView()){
                    HStack {
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
                        .overlay(Circle()
                        .stroke(Color.white, lineWidth: 2))
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        
                        Text("\(user.lastname ?? "") \(user.firstname ?? "")")
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .navigationBarItems(leading: BackButtonNavigationView())
                .navigationBarTitle("Friends")
        }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                
                if(value.startLocation.x < 20 && value.translation.width > 100) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            })).onAppear {
                self.friendsVM.getUser(userId: getUser()?.id ?? "")
        }
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

