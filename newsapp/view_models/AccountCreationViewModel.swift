//
//  AccountCreationViewModel.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 4/5/21.
//

import SwiftUI

class AccountCreationViewModel: ObservableObject {
    // User credentials
    @Published var name = ""
    @Published var email = ""
    
    // Login Credentials
    @Published var username = ""
    @Published var password = ""
    
    func login() {
        print("r")
    }
}
