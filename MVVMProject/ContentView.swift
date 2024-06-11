//
//  ContentView.swift
//  MVVMProject
//
//  Created by Younuz Bin Noushad on 30/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ContenteViewModel()
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                if let data = vm.model?.products{
                    ForEach(data,id: \.id){ i in
                        VStack{
                            Text(i.title)
                                .font(.system(size: 20))
                            AsyncImage(url: URL(string: "i.images[0]" ?? "person")){
                                image in
                                
                                if let im = image.image {
                                    im
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100,height: 100)
                                        .background(Color.red)
                                        .cornerRadius(50)
                                        .padding(10)
                                        .overlay(RoundedRectangle(cornerRadius: 60).stroke(lineWidth: 5))
                                    
                                }
                                
                            }
                        }
                        .frame(height: 200)
                        
                    }
                }else{
                    VStack{
                        ProgressView()
                    }
                }
            }
            
            .padding()
            .task {
                await vm.decode()
                print(vm.model)
            }
        }
    }
        
}

#Preview {
    ContentView()
}
