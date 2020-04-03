//
//  ContentViewView.swift
//  piczzie
//
//  Created by Thomas on 03/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct ContentViewView: View {
    
    @State var showMenu : Bool = false
    
    var body: some View {
        ZStack (alignment:.trailing){
            
            ProfilView(showMenu: self.$showMenu)
            
            GeometryReader { geometry in
                if self.showMenu {
                    MenuView().frame(width: geometry.size.width / 2)
                        .offset(x: geometry.size.width / 2)
                        .transition(.move(edge: .trailing))
                        .zIndex(4)
                }
            }
        }
    }
}

struct ContentViewView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewView()
    }
}
