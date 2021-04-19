//
//  RegistrationView.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 4/5/21.
//

import SwiftUI

struct AccountCreationView: View {
    
    @EnvironmentObject var accountCreation: AccountCreationViewModel
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
                Text("Create an Account").bold().font(.title)
                Text("Enjoying the news again starts here")
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
                
                // Email field
                TextField("Email", text: $accountCreation.email)
                    .padding()
                    .background(Color.init(UIColor.white))
                    .cornerRadius(5)
                    .padding(.leading, 25)
                    .padding(.top, 10)
                    .padding(.trailing, 25)
                    .padding(.bottom, 25)
                
                // Password field
                SecureField("Password", text: $accountCreation.password)
                    .padding()
                    .background(Color.init(UIColor.white))
                    .cornerRadius(5)
                    .padding(.leading, 25)
                    .padding(.top, 10)
                    .padding(.trailing, 25)
                    .padding(.bottom, 25)
                
                Button(action: accountCreation.login, label: {
                    Text("Create account")
                })
            }
        }
    }
}
