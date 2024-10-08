//
//  DataLoader.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import Foundation

class DataLoader: ObservableObject {
    @Published var data: [DrinksModel] = []
    var db = Database()
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
    
    func fetchNotTriedCocktails() -> [DrinksModel] {
        var drinks: [DrinksModel] = []
        
        for drink in data {
            if !db.fetchMyDrinkIDs().contains(drink.idDrink!) {
                drinks.append(drink)
            }
        }
        
        return drinks
    }
    
    func filterDrinks(data: [DrinksModel], searchText: String) -> [DrinksModel] {
        if searchText.isEmpty {
            return data
        } else {
            return data.filter { $0.strDrink?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
    
    func filterDrinks(data: [MyDrinksModel], searchText: String) -> [MyDrinksModel] {
        if searchText.isEmpty {
            return data
        } else {
            return data.filter { $0.strDrink.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    func listIngredients(drink: DrinksModel) -> [String] {
        var ingredients:[String] = []
        let ingredientSlots:[String] = [
            drink.strIngredient1!,
            drink.strIngredient2!,
            drink.strIngredient3!,
            drink.strIngredient4!,
            drink.strIngredient5!,
            drink.strIngredient6!,
            drink.strIngredient7!,
            drink.strIngredient8!,
            drink.strIngredient9!,
            drink.strIngredient10!,
            drink.strIngredient11!
        ]
        
        for ingredient in ingredientSlots {
            if ingredient != "null" {
                ingredients.append(ingredient)
            }
        }
        
        return ingredients
    }
}

