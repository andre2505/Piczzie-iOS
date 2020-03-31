//
//  MainView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        ZStack {
            Color("primaryColor").edgesIgnoringSafeArea(.top)
            Color.white.edgesIgnoringSafeArea(.bottom)
        TabView {
            
            LoginView().tabItem {
               Image(systemName: "tv.fill")
            }
            
            ProfilView().tabItem {
                Image(systemName: "phone.fill")
            }
        }.accentColor(Color("primaryColor"))
      }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
