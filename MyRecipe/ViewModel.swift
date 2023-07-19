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

struct Instruction: Codable {
    let meals: [Meal]
}

struct Meal: Hashable, Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3:String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    let strIngredient21: String
    let strIngredient22: String
    let strIngredient23: String
    let strIngredient24: String
    let strIngredient25: String
    let strIngredient26: String
    let strIngredient27: String
    let strIngredient28: String
    let strIngredient29: String
    let strIngredient30: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    let strMeasure21: String
    let strMeasure22: String
    let strMeasure23: String
    let strMeasure24: String
    let strMeasure25: String
    let strMeasure26: String
    let strMeasure27: String
    let strMeasure28: String
    let strMeasure29: String
    let strMeasure30: String
    let strSource: String
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String? 
}


class Model2: ObservableObject {
    @Published var instructions: [Meal] = []
    
    func fetchMultiple(mealIDs: [String]) {
        let group = DispatchGroup()
        
        for mealID in mealIDs {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
                continue
            }
            
            group.enter()
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                defer {
                    group.leave()
                }
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let instruction = try JSONDecoder().decode(Instruction.self, from: data)
                    DispatchQueue.main.async {
                        self?.instructions.append(contentsOf: instruction.meals)
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
        
        group.notify(queue: .main) {
            // All API calls are completed.
            // Handle the instructions for multiple meal IDs here.
        }
    }
}










//class Model2: ObservableObject {
//    @Published var instruction: [Instruction] = []
//
//    func fetch() {
//        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID") else {
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            do {
//                let instruction = try JSONDecoder().decode(Instruction.self, from: data)
//                DispatchQueue.main.async {
//                    self?.instruction = instruction.meals
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        task.resume()
//        }
//    }

