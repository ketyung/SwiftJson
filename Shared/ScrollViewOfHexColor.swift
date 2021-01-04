//
//  ScrollViewOfHexColor.swift
//  SwiftJson
//
//  Created by Chee Ket Yung on 01/01/2021.
//

import SwiftUI

struct ScrollViewOfHexColor : View {
    

    var body: some View {
    
        let colors = ["#345499", "#FEDF77", "#DDEF99","#998800","#AA0022", "#7799A0",
        "#345566", "#EEAD66","#4899A4", "#ab6799"]

        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach(colors,id:\.self){ color in
          
                    Circle().fill(Color(hex: color))
                    .frame(width: 50, height: 50)
              
                }
            }.padding()
        }
    }
}



struct ScrollViewOfHexColor_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOfHexColor()
    }
}
