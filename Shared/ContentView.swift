//
//  ContentView.swift
//  Shared
//
//  Created by Chee Ket Yung on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    let menuItems = Bundle.main.decodeJson([MenuItem].self, fileName: "Menus.json" )

    var body: some View {
        
        VStack (alignment: .leading,  spacing: 20){
          
            
            ForEach(menuItems) { item in
            
                HStack(spacing: 20) {
                    
                    Image(systemName: item.imageName)
                    .frame(width: 30, height: 30)
                    
                    Text (item.name)
            
                }
            
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}















//JsonProvider.getMenuItems()

/**
 
 """
 [
     { "id": 1, "name" : "Apple TV", "imageName" : "appletv"},
     { "id": 2, "name" : "Apple Watch", "imageName" : "applewatch"},
     { "id": 3, "name" : "Car", "imageName" : "car"},
     { "id": 4, "name" : "iPhone", "imageName" : "iphone"},
 ]
 """.decodeJson([MenuItem].self)
 
 */
