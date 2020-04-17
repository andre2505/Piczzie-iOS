//
//  HomeView.swift
//  piczzie
//
//  Created by Thomas on 13/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
            }.navigationBarTitle("Piczzie", displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(destination: CameraView()){
                    HStack {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 22, maxHeight: 22)
                    }
                })
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
