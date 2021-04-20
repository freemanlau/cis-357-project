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
                        .frame(width: 250, height: 130)
                        .scaledToFit()
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.accentColor, lineWidth: 2.5))
                        .shadow(radius: 10)
                    
                    LikeButton().frame(height: 30.0)
                                .alignmentGuide(.leading) { $0[.bottom] }
                        
                    Text(articleTitle)
                        .lineLimit(3)
                }
            }
            .padding(.top, 10)
            .padding(.trailing, 20)
    }
}
