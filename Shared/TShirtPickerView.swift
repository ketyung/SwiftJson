//
//  TShirtPickerView.swift
//  SwiftJson
//
//  Created by Chee Ket Yung on 01/01/2021.
//

import SwiftUI

struct TShirtPickerView : View {
    
    @State private var showPopUp = false
    
    @State private var selectedTshirt : TShirt?
    
    
    var body: some View {
        
        ZStack{
            
            mainView()
            
            if $showPopUp.wrappedValue {
                
                popupView()
            }
            
        }
       
        
    }
    
}

extension TShirtPickerView {
    
    private func mainView() -> some View {
        
        VStack (alignment: .leading,  spacing: 20){
       
            Button(action: {
                
                withAnimation {
          
                    self.showPopUp = true
                }
            }, label: {
                Text("Tap me to choose T-shirt")
            })
            
            if let tshirt = selectedTshirt {
                
                HStack (spacing:20) {
                    
                    let color = Color(hex: tshirt.hexColor)
                    Circle().fill(color)
                    .frame(width: 30, height: 30)
                    
                    Text(tshirt.name)
                    .foregroundColor(color)
                }
            }
            
            
        }
    }
    
    
    private func popupView() -> some View {
        
        VStack (alignment: .leading, spacing: 20) {
       
            let tshirts = Bundle.main.decodeJson( [TShirt].self, fileName: "Tshirts.json")  //JsonProvider.getTShirts()
            
            Text("T-shirt Colors")
            .frame(width: 200, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(Font.custom("Avenir-Black", size: 18.0))
        
            List(tshirts, id:\.hexColor) { tshirt in
                
                
                HStack(spacing: 10){
                        
                    let color = Color(hex: tshirt.hexColor)
                    
                    Circle().fill(color)
                    .frame(width: 24, height: 24)
                    
                    Text(tshirt.name)
                    .frame(width:80, height: 30, alignment: .leading)
                    .foregroundColor(color)
              
                    Text("QOH: \(tshirt.quantity)")
                    .frame(width:80, height: 30, alignment: .leading)
                        
                }
                .onTapGesture {
                    
                    self.selectedTshirt = tshirt
                    
                    withAnimation {
                        self.showPopUp = false
                    }
                }
            }
            
            
        }
        .padding()
        .frame(width: 260, height: 250)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20 )
       
    }
}

struct TShirtPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TShirtPickerView()
    }
}
