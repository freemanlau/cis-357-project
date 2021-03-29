//
//  LoginView.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 3/29/21.
//

import SwiftUI

struct LoginView: View {

    var body: some View {
        VStack {
            Image("Icon")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 74.0, height: 74.0)
                .padding(Edge.Set.bottom, 20.0)
            Text("Login").bold().font(.title)
        }
    }
}
