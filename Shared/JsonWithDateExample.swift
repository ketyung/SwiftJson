//
//  JsonWithDateExample.swift
//  SwiftJson (iOS)
//
//  Created by Chee Ket Yung on 02/01/2021.
//

import SwiftUI


struct JsonWithDateExample : View {

    private let newsItems  = """
    [
        {"id":1,"title":"We need to bring community and sustainability back to the heart of Ethereum",
        "datePublished":"2020-10-10 16:18:29"},
        {"id":2,"title":"Cryptocurrency's Rocky Road: China's ICO Ban",
        "datePublished":"2020-10-10 17:28:12"},
        {"id":3,"title":"Bitcoin surges to new peak as it continues bull run to next milestone: $30,000",
        "datePublished":"2020-10-10 18:05:34"}
    ]
    """.decodeJson([NewsItem].self,
        dateDecodingStrategy:
            DateFormatter().jsonDateDecodingStrategy(dateFormat: "yyyy-MM-dd HH:mm:ss"))
    
    var body: some View {
    
        List(newsItems){ newsItem in
            
            VStack(alignment: .leading, spacing:10){
                
                Text(newsItem.title)
                .font(.headline)
                
                Text(DateFormatter().string(from: newsItem.datePublished,
                dateFormat: "dd/MMM/yy HH:mm:ss"))
                .font(.caption)
            }
            
        }
    }
    
}


struct JsonWithDateExample_Previews: PreviewProvider {
    static var previews: some View {
        JsonWithDateExample()
    }
}
