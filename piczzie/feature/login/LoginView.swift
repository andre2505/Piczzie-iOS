//
//  ContentView.swift
//  piczzie
//
//  Created by Thomas on 29/01/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM = LoginViewModel()
    
    @State var email: String = ""
    @State var password: String = ""
    @State var sizeLineEmail: CGFloat = 1.0
    @State var sizeLinePassword : CGFloat = 1.0
    @State var primaryColor: Color = Color("primaryColor")
    @State var colorGrayDark: Color = Color("colorGrayDark")
    
    var body: some View {
        NavigationView {
            ZStack {
                primaryColor.edgesIgnoringSafeArea(.top)
                Color.white.edgesIgnoringSafeArea(.bottom)
            VStack {
                Spacer().frame(height: 50)
                VStack {
                    HStack {
                        
                        Image(systemName: "cloud.heavyrain.fill")
                        TextField("email", text: $email)
                            .foregroundColor(Color.black)
                            .accentColor(primaryColor)
                        
                    }
                    Rectangle()
                    .frame(height: sizeLineEmail, alignment: .bottom)
                    .foregroundColor(colorGrayDark)
                    
                    Spacer().frame(height: 20)
                    
                    HStack{
                        Image(systemName: "cloud.heavyrain.fill")
                        TextField("password", text: $password)
                        .foregroundColor(Color.black)
                        .accentColor(primaryColor)
                    }
                    Rectangle()
                    .frame(height: 0.5, alignment: .bottom)
                    .foregroundColor(colorGrayDark)
                    
                    Spacer().frame(height: 40)
                    
                    Button(action: {
                        self.loginVM.login(email: self.email, password: self.password)
                       
                    }) {
                        
                        Text("SEND")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(10)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(primaryColor, lineWidth: 1)
                            
                        ).background(RoundedRectangle(cornerRadius: 40).fill(primaryColor))
            
                    }
                    
                    Text(loginVM.user.email!)
                    
                }.padding()
                 .frame(width: 330, alignment: .center)
                 .background(Rectangle().fill(Color.white)
                 .shadow(radius: 2))
                 
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                .background(Color.white)
                .navigationBarHidden(true)
                .navigationBarTitle(Text(""))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
