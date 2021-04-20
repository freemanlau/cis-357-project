//
//  ArticlesRow.swift
//  newsapp
//
//  Created by AJ Natzic on 4/3/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct ArticlesRow: View {
    var category: String
    @StateObject var articleRetriever = ArticleRetriever()

    var body: some View {
        VStack(alignment: .leading) {
            Text(category.uppercased())
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(articleRetriever.response) {response in
                            ArticleItem(articleTitle: response.title, articleImage: response.image)
                        }
                    }
                    .onAppear {
                        articleRetriever.get(category: category.lowercased())
                    }
            }
            .frame(height: 250)
        }
    }
}

struct ResponseStructure: Identifiable {
    var id: String
    var title: String
    var description: String
    var url: String
    var image: String
}

class ArticleRetriever: ObservableObject {
    @Published var response = [ResponseStructure]()
    
    func get(category: String) {
        let source = "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=2965253d7ca64c63a58435403b289f9b"
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _,err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            for dataType in json["articles"] {
                let title = dataType.1["title"].stringValue
                let description = dataType.1["description"].stringValue
                let url = dataType.1["url"].stringValue
                let image = dataType.1["urlToImage"].stringValue
                let id = dataType.1["publishedAt"].stringValue
                DispatchQueue.main.async {
                    self.response.append(ResponseStructure(id: id, title: title, description: description, url: url, image: image))
                }
            }
        }.resume()
    }
}
