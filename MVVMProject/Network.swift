//
//  Network.swift
//  MVVMProject
//
//  Created by Younuz Bin Noushad on 30/05/24.
//

import Foundation

class Network{
    public static let net = Network()
    
    func getProduct(url: String,completion: @escaping(Data?,Bool)-> Void)async{
        guard let url = URL(string: url) else {
            return
        }
        let req = URLRequest(url: url)
        URLSession.shared.dataTask(with: req) { dta, resp, err in
            if let dta = dta {
                completion(dta,true)
            }else{
                completion(nil,false)
            }
        }.resume()
    }
}

