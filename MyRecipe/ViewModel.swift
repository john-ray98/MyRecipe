//
//  ViewModel.swift
//  MyRecipe
//
//  Created by John Ray on 7/17/23.
//

import Foundation
import SwiftUI

struct DessertResponse: Codable {
    let meals: [DessertRecipes]
}

struct DessertRecipes: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

class ViewModel: ObservableObject {
   
    @Published var dessertRecipe: [DessertRecipes] = []
    
    func fetch() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
           //Convert to JSON
            do {
                            let dessertResponse = try JSONDecoder().decode(DessertResponse.self, from: data)
                            DispatchQueue.main.async {
                                self?.dessertRecipe = dessertResponse.meals
                            }
                        } catch {
                            print(error)
                        }
                    }
                    task.resume()
                }
            }
