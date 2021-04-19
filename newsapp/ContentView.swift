//
//  ContentView.swift
//  newsapp
//
//  Created by AJ Natzic on 3/22/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

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

struct dataType : Identifiable {
    var id : String
    var title : String
    var description : String
    var url : String
    var image : String
}


