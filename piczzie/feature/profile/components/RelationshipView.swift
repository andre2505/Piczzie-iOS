//
//  RelationshipView.swift
//  piczzie
//
//  Created by Thomas on 07/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct RelationshipView: View {
    
    @EnvironmentObject var profilVM : ProfilViewModel
    
    var body: some View {
        HStack{
            NavigationLink(destination : FriendsView().environmentObject(profilVM)) {
                if(self.profilVM.user.friends?.count ?? 0 <= 1){
                    text.init(text: Text("\(String(profilVM.user.friends?.count ?? 0)) Friend"))
                }else {
                    text.init(text: Text("\(String(profilVM.user.friends?.count ?? 0)) Friends"))
                }
            }.buttonStyle(PlainButtonStyle())
            
            
            Divider().frame(maxWidth: 1, maxHeight: 50)
                .background(Color("colorGrey10"))
            
            NavigationLink(destination : ChildrenView().environmentObject(profilVM)){
                VStack(alignment: .center) {
                    if(self.profilVM.children.count <= 1){
                        text.init(text: Text("\(String(profilVM.children.count)) Child"))
                    }else {
                        text.init(text: Text("\(String(profilVM.children.count)) Children"))
                    }
                }
            }.buttonStyle(PlainButtonStyle())
        }.frame(maxWidth:.infinity, maxHeight: 50, alignment: .center)
            .background(Color.white)
            .onAppear {
                self.profilVM.getChildren(userId: getUser()?.id)
        }
    }
}

struct text: View {
    
    var text: Text
    
    var body: some View {
        text.frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.center)
            .font(.custom("Helvetica Bold", size: 14))
    }
}



struct RelationshipView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipView().environmentObject(ProfilViewModel())
    }
}
