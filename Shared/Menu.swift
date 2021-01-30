//
//  Menu.swift
//  SwiftJson (iOS)
//
//  Created by Chee Ket Yung on 30/01/2021.
//

import SwiftUI


enum PushToViewType : String, Decodable {
    case example1
    case example2
    case example3
    case example4
}

struct Item : Decodable, Identifiable {
    
    var id = UUID()
    
    var title : String
    
    var pushToViewType : PushToViewType
    
    private enum CodingKeys : String, CodingKey { case title, pushToViewType }
    
}


struct Menu : View {
    
    let items = Bundle.main.decodeJson([Item].self, fileName: "Items.json")
    
    var body : some View {
        
        NavigationView {
        
            List(items){ item in
            
                NavigationLink (
                    destination: pushToViewType(item.pushToViewType)){
                    Text(item.title)
               
                }
            }
            .navigationBarTitle("Tutorials")
        }
        
    }
    
}



extension Menu {
    
    
    @ViewBuilder
    private func pushToViewType(_ pushToViewType : PushToViewType) -> some View{
        
        
        switch (pushToViewType){
        
            case .example1 :
                JsonWithDateExample()
            case .example2 :
                ContentView()
            case .example3 :
                LoadRemoteJsonExample()
            case .example4 :
                TShirtPickerView()
      
        }
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
