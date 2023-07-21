//
//  MyRecipeApp.swift
//  MyRecipe
//
//  Created by John Ray on 7/17/23.
//

import SwiftUI

class MealDetailViewModel: ObservableObject {
    @Published var mealDetails: [String: MealDetail] = [:]

    func fetchDetails(for mealIDs: [String]) {
        for mealID in mealIDs {
            guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
                continue
            }

            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MealDetailResponse.self, from: data)
                    if let mealDetail = result.meals.first {
                        DispatchQueue.main.async {
                            self.mealDetails[mealID] = mealDetail
                        }
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
}

@main
struct MyRecipeApp: App {
    var mealDetailViewModel = MealDetailViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mealDetailViewModel)
        }
    }
}
