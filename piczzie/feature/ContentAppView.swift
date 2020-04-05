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

    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                MainView(self.$showMenu)
                
                if self.showMenu {
                    TransparencyView().background(Color.black.opacity(0.5))
                }
                
                GeometryReader { geometry in
                    if self.showMenu {
                        MenuView().frame(maxWidth: geometry.size.width / 2)
                            .offset(x: geometry.size.width / 2)
                            .transition(.move(edge: .trailing))
                    }
                }
            }.edgesIgnoringSafeArea(.top)
                
        }.environment(\.colorScheme, .light)
        
    }
}

struct ContentAppView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAppView()
    }
}
