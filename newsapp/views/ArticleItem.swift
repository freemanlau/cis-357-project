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
                        .frame(width: 275, height: 150)
                        .scaledToFit()
                        .cornerRadius(30)
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.accentColor, lineWidth: 2.5))
                    HStack(alignment: .bottom) {
                        LikeButton()
                        
                        Text(articleTitle)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                    }
                    .frame(width: 275)
                    .padding(.bottom, 25)
                }
            }
    }
}
