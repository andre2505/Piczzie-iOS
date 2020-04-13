//
//  ChildrenView.swift
//  piczzie
//
//  Created by Thomas on 08/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct ChildrenView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @EnvironmentObject var profilVM: ProfilViewModel
    
    @State private var showingSheet = false
    
    @GestureState private var dragOffset = CGSize.zero
    
    init(){
        UITableView.appearance().separatorColor = .gray
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Button(action : {
                self.showingSheet.toggle()
            }){
                HStack {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(Color("colorGrey"))
                        .frame(width: 24, height: 24)
                    
                    Spacer().frame(maxWidth: 16)
                    
                    Text("Ajouter un enfant")
                        .foregroundColor(Color.gray)
                        .font(.custom("Helvetica", size: 18))
                        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                }.padding(12)
                    .background(Color.white.shadow(radius: 1.5))
                    .frame(maxHeight: 50)
                    .padding(.bottom,2)
                
            }.sheet(isPresented: $showingSheet) {
                FriendsView()
            }
            
            
            List(profilVM.children){ (child:Child) in
                NavigationLink(destination: EmptyView()){
                    HStack {
                        Text("\(child.lastname ?? "") \(child.firstname ?? "")")
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            .navigationBarTitle("Children")
            .navigationBarItems(leading: BackButtonNavigationView())
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                
                if(value.startLocation.x < 20 && value.translation.width > 100) {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            }))
        }.onAppear {
            print(self.profilVM.children.count)
        }
      
    }
}

struct ChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenView().environmentObject(ProfilViewModel())
    }
}
