//
//  NewsItem.swift
//  newsapp
//
//  Created by AJ Natzic on 4/3/21.
//

import Foundation

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct NewsItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: "https://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic"))
                // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                .onSuccess { image, data, cacheType in
                    // Success
                    // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                }
                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                .placeholder(Image(systemName: "photo")) // Placeholder Image
                // Supports ViewBuilder as well
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 2)) // Fade Transition with duration
                .scaledToFit()
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color.accentColor, lineWidth: 2.5))
                .shadow(radius: 10)
            Text("Put Headline here")
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct NewsItem_Preview: PreviewProvider {
    static var previews: some View {
        NewsItem()
    }
}

