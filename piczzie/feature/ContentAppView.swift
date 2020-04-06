//
//  ContentViewView.swift
//  piczzie
//
//  Created by Thomas on 03/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct ContentAppView: View {
    
    @State var showMenu : Bool = false
    
    @State var currentTab: Int = 0
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(spacing:0) {
                    
                    MainView(self.$showMenu, self.$currentTab)
                    
                    HStack(alignment: .top){
                        HStack(alignment: .top){
                            Image((self.currentTab == 0) ? "home.selected" : "home.unselected")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(25)
                                .foregroundColor(Color(self.currentTab == 0 ?"primaryColor": "colorGrayDark"))
                                .frame(width: geometry.size.width/4, height: 75).onTapGesture {
                                    self.currentTab = 0
                            }
                            Image((self.currentTab == 1) ? "add.image.selected" : "add.image.unselected")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(25)
                                .foregroundColor(Color(self.currentTab == 1 ?"primaryColor": "colorGrayDark"))
                                .frame(width: geometry.size.width/4, height: 75).onTapGesture {
                                    self.currentTab = 1
                            }
                            Image((self.currentTab == 2) ? "search.selected" : "search.unselected")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(25)
                                .frame(width: geometry.size.width/4, height: 75)
                                .foregroundColor(Color(self.currentTab == 2 ?"primaryColor": "colorGrayDark"))
                                .onTapGesture {
                                    self.currentTab = 2
                            }
                            Image((self.currentTab == 3) ? "profil.selected": "profil.unselected")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(25)
                                .frame(width: geometry.size.width/4, height: 75).foregroundColor(Color(self.currentTab == 3 ?"primaryColor": "colorGrayDark"))
                                .onTapGesture {
                                    self.currentTab = 3
                            }
                        }.background(Color.white.opacity(0)).accentColor(Color("primaryColor")).padding(.bottom, 35)
                    }.frame(width: geometry.size.width, height: geometry.size.height/10)
                        .background(Color.white.shadow(radius: 1.5))
                }
            }
            
            if self.showMenu {
                TransparencyView().background(Color.black.opacity(0.5))
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
                    .edgesIgnoringSafeArea(.all)
            }
            
            GeometryReader { geometry in
                if self.showMenu {
                    MenuView().frame(maxWidth: geometry.size.width / 2)
                        .offset(x: geometry.size.width / 2)
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 0.5))
                }
            }
        }.edgesIgnoringSafeArea(.bottom)
        .environment(\.colorScheme, .light)
        .background(Color.white)
        .gesture(DragGesture()
        .onEnded {
            if $0.translation.width > -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
        })
    }
}

struct ContentAppView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAppView()
    }
}
