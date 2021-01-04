//
//  JsonProvider.swift
//  SwiftJson
//
//  Created by Chee Ket Yung on 01/01/2021.
//

import Foundation

class JsonProvider {
    
    static func jsonString1() -> String {
        
        return """
        [
            { "id": 1, "name" : "Apple TV", "imageName" : "appletv"},
            { "id": 2, "name" : "Apple Watch", "imageName" : "applewatch"},
            { "id": 3, "name" : "Car", "imageName" : "car"},
            { "id": 4, "name" : "iPhone", "imageName" : "iphone"},
        ]
        """
    }
    
    static func jsonString2() -> String {
        
        return """
        [
            { "tshirt_color_in_hex": "#0000A0", "qty" : 12, "name" : "Dark Blue"},
            { "tshirt_color_in_hex": "#a52a2a", "qty" : 10, "name" : "Brown"},
            { "tshirt_color_in_hex": "#FF0000", "qty" : 5, "name" : "Red"},
            { "tshirt_color_in_hex": "#00FF00", "qty" : 3, "name" : "Lime"},
            { "tshirt_color_in_hex": "#FFA500", "qty" : 2, "name" : "Orange"},
            { "tshirt_color_in_hex": "#808000", "qty" : 1, "name" : "Olive"},
            { "tshirt_color_in_hex": "#2B547E", "qty" : 1, "name" : "Blue Jay"},
        ]
        """
    }
    
    
    
    static func getTShirts() -> [TShirt]{
        
        
        let jsonStr = jsonString2()
        
        return jsonStr.decodeJson([TShirt].self)
        
    }
    
    
    
    static func getMenuItems() -> [MenuItem]{
        
        let jsonStr = jsonString1()
        
        return jsonStr.decodeJson([MenuItem].self)
        
    }
}
