//
//  MainView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @Binding private var currentTab: Int
    
    @Binding var showMenu: Bool
    
    init(_ showMenu : Binding<Bool>, _ currentTab: Binding<Int>) {
        
        _showMenu = showMenu
        _currentTab = currentTab
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor(named: "primaryColor")
        
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white,.font: UIFont(name: "Helvetica", size: 20)!]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Georgia-Bold", size: 20)!]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = UIColor.white
        
    }
    
    var body: some View {
        ZStack {
            LoginView().opacity(self.currentTab == 0 ? 1 : 0)
            
            TransparencyView().opacity(self.currentTab == 1 ? 1 : 0)
            
            TransparencyView().opacity(self.currentTab == 2 ? 1 : 0)
            
            ProfilView(showMenu: $showMenu)
                .environmentObject(GiftViewModel())
                .environmentObject(FavoriteViewModel())
                .opacity(self.currentTab == 3 ? 1 : 0)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(.constant(false), .constant(0))
    }
}
