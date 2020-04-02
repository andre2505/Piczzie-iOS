//
//  FriendsView.swift
//  piczzie
//
//  Created by Thomas on 02/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct FriendsView: View {
    
    @Environment (\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {
        VStack {
            VStack {
                
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    HStack {
                        Image(systemName: "arrow.left")
                    }
                })
            }
        }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                if(value.startLocation.x < 20 && value.translation.width > 100) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }))
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

