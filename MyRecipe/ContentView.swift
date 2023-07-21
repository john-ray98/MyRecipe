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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dessertRecipe, id: \.self) { dessertRecipe in
                    NavigationLink(destination: DetailView(mealID: dessertRecipe.idMeal)) {
                        Text("Show Details")
                    }
                    VStack {
                        Text(dessertRecipe.strMeal).bold()
                        Text(dessertRecipe.idMeal)
                        URLImage(urlString: dessertRecipe.strMealThumb, data: nil)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Desserts")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct DetailView: View {
    let mealID: String
    @EnvironmentObject private var mealDetailViewModel: MealDetailViewModel
    
    var body: some View {
        List {
            if let mealDetail = mealDetailViewModel.mealDetails[mealID] {
                
                Section {
                    Text(mealDetail.strMeal).font(.headline)
                    Text(mealDetail.strCategory).font(.subheadline)
                    Text(mealDetail.id)
                    Text(mealDetail.strInstructions)
                }
                Section {
                    Text(mealDetail.strIngredient1)
                    Text(mealDetail.strIngredient2)
                    Text(mealDetail.strIngredient3)
                    Text(mealDetail.strIngredient4)
                    Text(mealDetail.strIngredient5)
                    if let ingredient6 = mealDetail.strIngredient6 {
                        Text(ingredient6)
                        if let ingredient7 = mealDetail.strIngredient7 {
                            Text(ingredient7)
                        }
                        if let ingredient8 = mealDetail.strIngredient8 {
                            Text(ingredient8)
                        }
                        if let ingredient9 = mealDetail.strIngredient9 {
                            Text(ingredient9)
                        }
                        if let ingredient10 = mealDetail.strIngredient10 {
                            Text(ingredient10)
                        }
                        if let ingredient11 = mealDetail.strIngredient11 {
                            Text(ingredient11)
                        }
                        if let ingredient12 = mealDetail.strIngredient12 {
                            Text(ingredient12)
                        }
                        if let ingredient13 = mealDetail.strIngredient13 {
                            Text(ingredient13)
                        }
                        if let ingredient14 = mealDetail.strIngredient14 {
                            Text(ingredient14)
                        }
                        if let ingredient15 = mealDetail.strIngredient15 {
                            Text(ingredient15)
                        }
                    }
                }
                
                
                Section {
                    Text(mealDetail.strMeasure1)
                    Text(mealDetail.strMeasure2)
                    Text(mealDetail.strMeasure3)
                    Text(mealDetail.strMeasure4)
                    Text(mealDetail.strMeasure5)
                    if let measure6 = mealDetail.strMeasure6 {
                        Text(measure6)
                    }
                    if let measure7 = mealDetail.strMeasure7 {
                        Text(measure7)
                    }
                    if let measure8 = mealDetail.strMeasure8 {
                        Text(measure8)
                    }
                    if let measure9 = mealDetail.strMeasure9 {
                        Text(measure9)
                    }
                    if let measure10 = mealDetail.strMeasure10 {
                        Text(measure10)
                    }
                }
                Section {
                    if let measure11 = mealDetail.strMeasure11 {
                        Text(measure11)
                    }
                    if let measure12 = mealDetail.strMeasure12 {
                        Text(measure12)
                    }
                    if let measure13 = mealDetail.strMeasure13 {
                        Text(measure13)
                    }
                    if let measure14 = mealDetail.strMeasure14 {
                        Text(measure14)
                    }
                    if let measure15 = mealDetail.strMeasure15 {
                        Text(measure15)
                    }
                }
                
                // Display more details as needed
                
                // Optionally, use the URLImage view to show an image
                // URLImage(urlString: mealDetail.strMealThumb, data: nil)
                //     .frame(width: 130, height: 300)
                //     .background(Color.gray)
            }
        }
                    .padding()
                
                    .onAppear {
                        mealDetailViewModel.fetchDetails(for: [mealID])
                    }
        .navigationTitle("Meal Details")
        }
}




// MealDetail and MealDetailResponse structs to decode meal details
struct MealDetail: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strArea: String
    let strMealThumb: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3:String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strIngredient21: String?
    let strIngredient22: String?
    let strIngredient23: String?
    let strIngredient24: String?
    let strIngredient25: String?
    let strIngredient26: String?
    let strIngredient27: String?
    let strIngredient28: String?
    let strIngredient29: String?
    let strIngredient30: String?
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strMeasure21: String?
    let strMeasure22: String?
    let strMeasure23: String?
    let strMeasure24: String?
    let strMeasure25: String?
    let strMeasure26: String?
    let strMeasure27: String?
    let strMeasure28: String?
    let strMeasure29: String?
    let strMeasure30: String?
    
    var id: String { idMeal } // Implement the Identifiable protocol by providing the id property
   }


struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

