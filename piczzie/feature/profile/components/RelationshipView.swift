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
        HStack(){
            NavigationLink(destination : EmptyView()){
                VStack(alignment: .center) {
                    Text("\(String(self.profilVM.user.friends?.count ?? 0))")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity)
                        .font(.custom("Helvetica Bold", size: 14))
                    
                    Text("Amis")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity)
                        .font(.custom("Helvetica Bold", size: 14))
                }
            }.buttonStyle(PlainButtonStyle())
            
            
            Divider().frame(maxWidth: 1, maxHeight: 50)
                .background(Color("colorGrey10"))
            
            NavigationLink(destination : EmptyView()){
                Text("Enfant")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity)
            }.buttonStyle(PlainButtonStyle())
            
            
        }.frame(maxWidth:.infinity, alignment: .center)
            .background(Color.white)
    }
}

struct RelationshipView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipView()
    }
}
