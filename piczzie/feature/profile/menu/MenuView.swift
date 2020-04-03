//
//  MenuView.swift
//  piczzie
//
//  Created by Thomas on 03/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.top)
           
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Profile")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 100)
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Messages")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
                .padding(.top, 30)
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.headline)
                }.padding(.top, 30)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                .background(Color.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
