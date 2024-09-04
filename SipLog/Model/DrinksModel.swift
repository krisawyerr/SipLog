//
//  DrinksModel.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import Foundation

struct DrinksModel: Codable, Identifiable {
    var id: String {
        idDrink ?? UUID().uuidString
    }

    let idDrink: String?
    let strDrink: String?
    let strCategory: String?
    let strAlcoholic: String?
    let strDrinkThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strImageSource: String?
    let strImageAttribution: String?
}
