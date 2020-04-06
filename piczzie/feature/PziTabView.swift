//
//  PziTabView.swift
//  piczzie
//
//  Created by Thomas on 06/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct PziTabView: View {
    var body: some View {
             HStack(spacing: 50) {
              ZStack {
                  Circle()
                      .foregroundColor(Color.blue)
                      .frame(width: 70, height: 70)
                  Image(systemName: "camera")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .padding(20)
                      .frame(width: 70, height: 70)
                      .foregroundColor(.white)
              }
              ZStack {
                  Circle()
                      .foregroundColor(Color.blue)
                      .frame(width: 70, height: 70)
                  Image(systemName: "photo")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .padding(20)
                      .frame(width: 70, height: 70)
                      .foregroundColor(.white)
              }
          }
    }
}

struct PziTabView_Previews: PreviewProvider {
    static var previews: some View {
        PziTabView()
    }
}
