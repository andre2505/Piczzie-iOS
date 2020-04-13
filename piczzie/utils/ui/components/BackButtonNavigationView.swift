//
//  BackButtonNavigationView.swift
//  piczzie
//
//  Created by Thomas on 09/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct BackButtonNavigationView: View {
    
   @Environment (\.presentationMode) var presentationMode
   @State var isOpen = false
    
    var body: some View {
        Button(action:{
            self.presentationMode.wrappedValue.dismiss()
        }){
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .imageScale(.large)
                    .font(.custom("Helvetica Bold", size: 16))
                    .foregroundColor(Color.white)
                    .padding(5)
            }
        }
    }
}

struct BackButtonNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonNavigationView()
    }
}
