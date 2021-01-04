//
//  LoadRemoteJsonExample.swift
//  SwiftJson (iOS)
//
//  Created by Chee Ket Yung on 02/01/2021.
//

import SwiftUI


struct LoadRemoteJsonExample : View {
    
    @State private var menuItems : [MenuItem] = []
    
    @State private var showLoading : Bool = false

    @State private var showErrorAlert = false

    @State private var errorMessage : String = ""
    
    var body: some View {
    
        ZStack {
        
            List (menuItems) { item in
                
                HStack(spacing: 20) {
                    
                    Image(systemName: item.imageName)
                    .frame(width: 30, height: 30)
                    
                    Text (item.name)
            
                }
            }
            .onAppear{
             
                if  self.menuItems.count == 0 {
                
                    self.showLoading = true
                    
                    // remove the delay execution if
                    // do not need it. The delay execution
                    // here is to allow some time to show the
                    // spinning ProgressView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
                        URLSession.shared.decodeJson([MenuItem].self,
                           urlString: "https://techchee.com/somejsons/Menus.json",
                           
                           completion: { result in
                            
                                switch(result){
                            
                                    case .success(let mItems) :
                                        self.menuItems = mItems
                                
                                    case .failure(let err) :
                                        self.showErrorAlert = true
                                        self.errorMessage = err.localizedDescription
                                    
                                }
                                self.showLoading = false
                            
                           })
                    }
                    
                }
                
            }
            
            // show alert
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error!"), message: Text(self.errorMessage), dismissButton: .default(Text("OK")))
            }
       
            
            
            if $showLoading.wrappedValue {
                
                // Available in iOS 14
                ProgressView()
                .scaleEffect(2, anchor: .center)
            }
            
        }
       
    }
    
}



struct LoadRemoteJsonExample_Previews: PreviewProvider {
    static var previews: some View {
        LoadRemoteJsonExample()
    }
}
