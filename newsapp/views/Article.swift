//
//  Article.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 4/20/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
struct Article: View {
    @State var image: String = ""
    
    var body: some View {
        VStack {
            if image != "" {
                WebImage(url: URL(string: image), options: .highPriority)
                    .onSuccess {image, data, cacheType in }
                    .resizable()
                    .frame(width: 275, height: 150)
            }
        }
    }
}
