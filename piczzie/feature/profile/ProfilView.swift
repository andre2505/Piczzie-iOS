//
//  ProfilView.swift
//  piczzie
//
//  Created by Thomas on 29/03/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct ProfilView: View {
    
    @Environment(\.imageCache) var cache: ImageCache
    
    @ObservedObject var profilVM = ProfilViewModel()
    
    init() {

        UINavigationBar.appearance().backgroundColor = UIColor(named: "primaryColor")

         UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
                   .font : UIFont(name:"Helvetica Neue", size: 40)!]
    }
    
    
    var body: some View {
    NavigationView {
        VStack(spacing:0) {
          VStack {
                //IMAGE
                AsyncImage(
                    url: URL(string: "http://192.168.1.51:8080/\(String(describing: getUser()?.photo! ?? ""))")!,
                     placeholder: Text("Loading ..."), cache: self.cache
                ).aspectRatio(contentMode: .fit)
                 .clipShape(Circle())
                 .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .frame(width: 100, height: 100)
            
                Text("profil")
         }.padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("colorGrey10"))
            Divider().frame(height: 0.5).background(Color("colorGrey10"))
            HStack {
                Button(action: {
                    
                                      
                }) {
                   Image("cloud.heavyrain.fill")
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .frame(maxWidth: .infinity)
                }
               
                Button(action: {
                                 
                                                   
                }) {
                    Image("cloud.heavyrain.fill")
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    .frame(maxWidth: .infinity)
                }
                
            }.padding(18)
                .frame(maxWidth: .infinity, alignment: .center)
            Divider().frame(height: 0.5).background(Color("colorGrey10"))
            
            VStack {
    
                WaterfallGrid(profilVM) { (gift: Gift) in
                

             AsyncImage(url: URL(string: "http://192.168.1.51:8080/\(String(describing: getUser()?.photo! ?? ""))")!,
             placeholder: Text("Loading ..."), cache: self.cache
             ).aspectRatio(contentMode: .fit).onAppear {
                self.profilVM.loadMore(currentItem: gift)
                    }
                }.gridStyle(colums: 3)
                )
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment:.top)
                .background(Color.gray)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
        .navigationBarTitle("Profil", displayMode: .inline)
    }
}


struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
    
}
