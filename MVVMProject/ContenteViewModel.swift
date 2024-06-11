//
//  ContenteViewModel.swift
//  MVVMProject
//
//  Created by Younuz Bin Noushad on 30/05/24.
//

import Foundation

class ContenteViewModel: ObservableObject{
    static let viewmodel = ContenteViewModel()
    @Published var model: ProductModel?
    
    func decode() async {
        do{
        let url = URL(string: "https://dummyjson.com/products")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedata = try JSONDecoder().decode(ProductModel.self, from: data)
            DispatchQueue.main.async {
                self.model = decodedata
            }
        }catch{
            print("error")
        }
    }
}
//"https://dummyjson.com/products"
