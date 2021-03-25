//
//  ContentView.swift
//  newsapp
//
//  Created by AJ Natzic on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    @State private var darkMode = false
    
    @State private var accentColor = Color.blue
    
    var body: some View {
        TabView {
            Text("Home")
                .padding()
                .tabItem {
                    Image(systemName: "antenna.radiowaves.left.and.right")
                    Text("News")
                }
            Text("Favorites")
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            NavigationView {
                Form {
                    Section(header: Text("View Settings")) {
                        Toggle("Dark Mode", isOn: $darkMode)
                            .onChange(of: darkMode, perform: { value in
                                setupColorScheme()
                            })
                        ColorPicker("Accent color", selection: $accentColor, supportsOpacity: false)
                            .onChange(of: accentColor, perform: { value in
                                setupColorScheme()
                            })
                    }
                    
                    Section {
                        Button("Remove all favorites"){
                            showingAlert = true
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Are you sure you want to delete all favorites?"),
                                message: Text("These cannot be recovered."),
                                primaryButton: .destructive(Text("Delete")) {
                                    print("Deleting...")
                                    // TODO: Method that deletes all favorites
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                }
                .navigationBarTitle(Text("Settings"))
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        
    }
    
    private func setupColorScheme() {
        if(darkMode) {
            let window = UIApplication.shared.windows.first
            window?.overrideUserInterfaceStyle = .dark
            window?.tintColor = UIColor(accentColor)
        }
        else {
            let window = UIApplication.shared.windows.first
            window?.overrideUserInterfaceStyle = .light
            window?.tintColor = UIColor(accentColor)
        }
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
