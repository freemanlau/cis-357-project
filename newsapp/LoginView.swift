//
//  LoginView.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 3/29/21.
//

import SwiftUI

struct LoginView: View {
    let loginFieldColor = Color(red: 239/255, green: 243/255, blue: 244/255, opacity: 1)
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color.init(UIColor(red: 1.00, green: 0.97, blue: 0.97, alpha: 1.00)).ignoresSafeArea()
            VStack {
                // App icon
                Image("Icon")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                
                // Login title and subtitle
                Text("Welcome!").bold().font(.title)
                Text("A new way to get your news")
                    .font(.subheadline)
                    .padding(.bottom, 70)
                
                // Username field
                TextField("Username", text: $username)
                    .padding()
                    .background(loginFieldColor)
                    .cornerRadius(5)
                    .padding(20)
            }
        }
    }
}
