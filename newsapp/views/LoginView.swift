//
//  LoginView.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 3/29/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var accountCreation: AccountCreationViewModel
    @State var username: String = ""
    @State var password: String = ""
    @State var showMainTabView: Bool = false
    
    fileprivate func loginButtonContent() -> some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.init(UIColor(red: 1.00, green: 0.16, blue: 0.40, alpha: 1.00)))
            .cornerRadius(15)
    }
    
    
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
                TextField("Username", text: $accountCreation.username)
                    .padding()
                    .background(Color.init(UIColor.white))
                    .cornerRadius(5)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .padding(.bottom, 10)
                
                // Password field
                SecureField("Password", text: $accountCreation.password)
                    .padding()
                    .background(Color.init(UIColor.white))
                    .cornerRadius(5)
                    .padding(.leading, 25)
                    .padding(.top, 10)
                    .padding(.trailing, 25)
                    .padding(.bottom, 25)
                
                // Login button
                NavigationLink(destination: MainTabView(), isActive: $showMainTabView) {
                    Text("")
                }
                Button(action: {
                    if accountCreation.username == "admin" && accountCreation.password == "123" {
                        print("login")
                        self.showMainTabView = true
                    }
                }) {
                    loginButtonContent()
                }
                
                // Acount creation link
                NavigationLink(destination: AccountCreationView()) {
                    Text("Don't have an account? Create one here.")
                }
                
                
            }
        }
    }
}
