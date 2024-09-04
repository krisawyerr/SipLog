//
//  DataLoader.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import Foundation

class DataLoader: ObservableObject {
    @Published var data: [DrinksModel] = []
    var sotmIndex: Int = 0

     init() {
         loadData()
        sotmIndex = Int.random(in: 0...440)
     }
    
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter.string(from: Date())
    }

     func loadData() {
         if let url = Bundle.main.url(forResource: "drinks", withExtension: "json") {
             do {
                 let data = try Data(contentsOf: url)
                 let decoder = JSONDecoder()
                 let decodedData = try decoder.decode([DrinksModel].self, from: data)
                 self.data = decodedData
             } catch {
                 print("Error loading data: \(error)")
             }
         }
     }
    
    func picSOTM() -> DrinksModel {
        return data[sotmIndex]
    }
    
    func fetchCocktails(base: String) -> [DrinksModel] {
        var drinks: [DrinksModel] = []
        
        for drink in data {
            if 
                drink.strIngredient1 == base ||
                drink.strIngredient2 == base ||
                drink.strIngredient3 == base ||
                drink.strIngredient4 == base ||
                drink.strIngredient5 == base ||
                drink.strIngredient6 == base ||
                drink.strIngredient7 == base ||
                drink.strIngredient8 == base ||
                drink.strIngredient9 == base ||
                drink.strIngredient10 == base ||
                drink.strIngredient11 == base
            {
                drinks.append(drink)
            }
        }
        
        return drinks
    }
    
    
    func fetchCocktails(base: String, amountOfItems: Int) -> [DrinksModel] {
        var drinks: [DrinksModel] = []
        
        for drink in data {
            if drinks.count < amountOfItems {
                if
                    drink.strIngredient1 == base ||
                    drink.strIngredient2 == base ||
                    drink.strIngredient3 == base ||
                    drink.strIngredient4 == base ||
                    drink.strIngredient5 == base ||
                    drink.strIngredient6 == base ||
                    drink.strIngredient7 == base ||
                    drink.strIngredient8 == base ||
                    drink.strIngredient9 == base ||
                    drink.strIngredient10 == base ||
                    drink.strIngredient11 == base
                {
                    drinks.append(drink)
                }
            }
        }
        
        return drinks
    }
}

