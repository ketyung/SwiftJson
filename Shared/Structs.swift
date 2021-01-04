//
//  Structs.swift
//  SwiftJson
//
//  Created by Chee Ket Yung on 01/01/2021.
//

import Foundation

struct MenuItem : Decodable, Identifiable {
    
    var id : Int
    
    var name : String
    
    var imageName : String

}


struct TShirt : Decodable {
    
    var hexColor : String
    
    var name : String
    
    var quantity : Int
    
    
    enum CodingKeys: String, CodingKey {
       case name
       // Map the JSON key "tshirt_color_in_hex" to the Swift property name "hexColor"
       case hexColor = "tshirt_color_in_hex"
       // Map the JSON key "qty" to the Swift property name "quantity"
       case quantity = "qty"
    }

}


struct NewsItem : Decodable, Identifiable {
    
    var id : Int
    
    var title : String
    
    var datePublished : Date
    
}
 
