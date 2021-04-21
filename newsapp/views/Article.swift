//
//  Article.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 4/20/21.
//

import Foundation
import SwiftUI

struct Article: View {
    @State var articleUrl: String = ""
    
    var body: some View {
        ArticleWebView(url: articleUrl)
    }
}
