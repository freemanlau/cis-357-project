//
//  NewsRow.swift
//  newsapp
//
//  Created by AJ Natzic on 4/3/21.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct NewsRow: View {
    var categoryName: String
    @ObservedObject var results = getData()

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(results.datas) {i in
                            NewsItem(title: i.title, image: i.image)
                        
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

struct dataType : Identifiable {
    var id : String
    var title : String
    var description : String
    var url : String
    var image : String
}

class getData : ObservableObject {
    @Published var datas = [dataType]()
    
    init() {
        let source = "https://newsapi.org/v2/top-headlines?country=us&apiKey=2965253d7ca64c63a58435403b289f9b"
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _,err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for i in json["articles"] {
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                DispatchQueue.main.async {
                    self.datas.append(dataType(id: id, title: title, description: description, url: url, image: image))
                }
            }
        }.resume()
    }
}
