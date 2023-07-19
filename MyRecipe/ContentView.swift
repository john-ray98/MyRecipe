//
//  ContentView.swift
//  MyRecipe
//
//  Created by John Ray on 7/17/23.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 300)
                .background(Color.gray)
        }
            else {
            Image(systemName: "fork")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 300)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var model2 = Model2()
    @State var mealIDs: [String] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dessertRecipe, id: \.self) { dessertRecipe in
                   
                            VStack {
                                Text(dessertRecipe.strMeal).bold()
                                Text(
                                    dessertRecipe.idMeal)
                                URLImage(urlString: dessertRecipe.strMealThumb, data: nil)
                                   
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                
            
            .navigationTitle("Desserts")
            .onAppear {
               viewModel.fetch()
            
                
                mealIDs = viewModel.dessertRecipe.map {$0.idMeal}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
