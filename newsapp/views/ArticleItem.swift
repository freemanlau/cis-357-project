//
//  ArticleItem.swift
//  newsapp
//
//  Created by AJ Natzic on 4/3/21.
//

import Foundation

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct ArticleItem: View {
    @State var isFavorite = false
    @State var imageURL: String = ""
    @State var articleTitle: String = ""
    @State var articleImage: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            if articleImage != "" {
                WebImage(url: URL(string: articleImage), options: .highPriority)
                    .onSuccess {image, data, cacheType in }
                    .resizable()
                    .frame(width: 100, height: 135)
                    .scaledToFit()
                    .cornerRadius(30)
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.accentColor, lineWidth: 2.5))
                    .shadow(radius: 10)
                Group {
                    ZStack {
                        LikeButton().padding(.trailing, 20.0)
                            .frame(height: 30.0)
                            .alignmentGuide(.trailing) { $0[.bottom] }
                            
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    Text(articleTitle)
                        .font(.custom("Cochin", size: 25))
                        .fontWeight(.heavy)
                        .padding(15)
                }
            }
            
        }
        .padding(.leading, 15)
    }
}
