//
//  NewsRow.swift
//  newsapp
//
//  Created by AJ Natzic on 4/3/21.
//

import SwiftUI

struct NewsRow: View {
    var categoryName: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(0..<10) {_ in   // TODO: loop through last 50 news items from API
                        NewsItem()
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct NewsRow_Preview: PreviewProvider {

    static var previews: some View {
        NewsRow(categoryName: "Cool")
    }
}
