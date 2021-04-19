//
//  ContentView.swift
//  newsapp
//
//  Created by AJ Natzic on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var accountCreation = AccountCreationViewModel()
    var user = User()
    
    var body: some View {
        NavigationView {
            VStack {
                LoginView()
                    .environmentObject(accountCreation)
                //AccountCreationView()
                //    .environmentObject(accountCreation)
        
            }
        }
    }
}
