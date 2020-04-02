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
    private var profilView: ProfilView = ProfilView()
    init() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .blue
        
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
            Color("primaryColor").edgesIgnoringSafeArea(.top)
            Color.white.edgesIgnoringSafeArea(.bottom)
            TabView(selection : $currentTab) {
                
                LoginView().tabItem {
                    Image((currentTab == 0) ? "home.selected" : "home.unselected")
                }.tag(0)
                
                FriendsView().tabItem {
                   Image((currentTab == 1) ? "add.image.selected" : "add.image.unselected")
                }.tag(1)
                
                FriendsView().tabItem {
                   Image((currentTab == 2) ? "search.selected" : "search.unselected")
                }.tag(2)
                
                NavigationView {
                    getprofilView()
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text(""))
                    
                }.tabItem {
                    Image((currentTab == 3) ? "profil.selected" : "profil.unselected")
                }.tag(3)
                
            }.accentColor(Color("primaryColor"))
        }
    }
    
    private func getprofilView() -> ProfilView {
        return profilView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
