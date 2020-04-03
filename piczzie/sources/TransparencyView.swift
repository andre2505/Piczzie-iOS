//
//  TransparencyView.swift
//  piczzie
//
//  Created by Thomas on 03/04/2020.
//  Copyright © 2020 rooster. All rights reserved.
//

import SwiftUI

struct TransparencyView: View {
    var body: some View {
        VStack {
            Text("")
        }.background(Color.white.opacity(1))
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct TransparencyView_Previews: PreviewProvider {
    static var previews: some View {
        TransparencyView()
    }
}
