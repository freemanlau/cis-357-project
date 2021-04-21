//
//  ArticleWebView.swift
//  newsapp
//
//  Created by Kyle P. Ronayne on 4/20/21.
//

import Foundation
import SwiftUI
import WebKit

struct ArticleWebView: UIViewRepresentable {
    @State var url: String = ""

    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<ArticleWebView>) {
        
    }
}
