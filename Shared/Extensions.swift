//
//  Extensions.swift
//  SwiftJson
//
//  Created by Chee Ket Yung on 01/01/2021.
//

import SwiftUI

extension Color {
    
    public init(hex : String){
        
        // remove the #
        var hexColor = hex.replacingOccurrences(of: "#", with: "")
        
        // set the alpha channel = 1 by default , if it's not provided
        if hexColor.count == 6 {
            
            hexColor = "\(hexColor)FF"
        }
        
        
        if ( hexColor.count == 8 ){
       
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                
                let r = Double((hexNumber & 0xff000000) >> 24) / 255
                let g = Double((hexNumber & 0x00ff0000) >> 16) / 255
                let b = Double((hexNumber & 0x0000ff00) >> 8) / 255
                let a = Double(hexNumber & 0x000000ff) / 255
              
                self.init(.sRGB,red: r,green: g,blue:  b,
                            opacity: a)
            }
            else {
                
                self.init(UIColor.black)
            }
           
        }
        else {
            
            self.init(UIColor.black)
        }
       
        
    }
}


extension DateFormatter {
    
    func jsonDateDecodingStrategy(dateFormat : String ) -> JSONDecoder.DateDecodingStrategy{
        
        self.dateFormat = dateFormat
       // self.locale = Locale(identifier: "en_US")
        //self.timeZone = TimeZone = TimeZone(secondsFromGMT: 0)
        
        return .formatted(self)
    }
    
    func string( from : Date ,dateFormat : String ) -> String {
        
        self.dateFormat = dateFormat

        return self.string(from: from)        
    }
    
    
}



extension String {
    
    
    func decodeJson  <T:Decodable>  (_ type : T.Type,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        
        let jsonData = self.data(using: .utf8)!
       
        do {
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            
            let result = try decoder.decode(T.self, from: jsonData)
            
            return result
        }
        catch {
            
            fatalError("err:\(error)")
        }
        
    }
    
}

extension Bundle {
    
    func decodeJson <T:Decodable> (_ type : T.Type , fileName : String,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            
            fatalError("Failed to load file ")
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            let result = try JSONDecoder().decode(T.self, from: jsonData)
            
            return result
            //let jsonStr = try String(contentsOf: url)
            
            //return jsonStr.decodeJson(type)
        }
        catch {
            
            fatalError("err:\(error)")
        }
        
        
    }
}


@frozen
public enum Result<Success, Failure: Error> {
  
    case success(Success)

    case failure(Failure)
}

extension URLSession {
    
    func decodeJson <T:Decodable> (_ type : T.Type , urlString : String ,
        completion: @escaping (Result<T, Error>)->Void,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys)  {
        
        guard let url = URL(string: urlString) else {
            
            return
            
        }
        
        let task = self.dataTask(with: url, completionHandler: { data, response, error in
            
            if let error = error {
                
                completion(.failure(error))
                
            }
            else {
            
                do {
                    
                    let results = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(results))
                }
                catch {
                    
                    completion(.failure(error))
                }
              
            }
            
        })
        
        task.resume()
    
    }
}
