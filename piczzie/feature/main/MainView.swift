//
//  MainView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentTab: Int = 0
    
    @Binding var showMenu: Bool
    
    init(_ showMenu : Binding<Bool>) {
        
        _showMenu = showMenu
        
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .white
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(named: "primaryColor")
        
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = UIColor.white
        
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.top)
            (!self.showMenu) ? Color.white.edgesIgnoringSafeArea(.bottom) :
                Color.black.opacity(0.5).edgesIgnoringSafeArea(.bottom)
            TabView(selection : self.$currentTab) {
                
                LoginView().tabItem {
                    Image((self.currentTab == 0) ? "home.selected" : "home.unselected")
                }.tag(0)
                
                EmptyView().tabItem {
                    Image((self.currentTab == 1) ? "add.image.selected" : "add.image.unselected")
                }.tag(1)
                
                EmptyView().tabItem {
                    Image((self.currentTab == 2) ? "search.selected" : "search.unselected")
                }.tag(2)
                NavigationView {
                    ProfilView(showMenu: $showMenu)
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text(""))
                }
                .tabItem {
                    Image((self.currentTab == 3) ? "profil.selected" : "profil.unselected")
                }.tag(3)
            }.accentColor(Color("primaryColor"))
                .edgesIgnoringSafeArea(.bottom)
                .padding(.bottom, 1)
                .background(Color.white)
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(.constant(false))
    }
}
