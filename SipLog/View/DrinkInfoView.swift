//
//  DrinkInfoView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import SwiftUI

struct DrinkInfoView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var dataLoader = DataLoader()
    var db = Database()
    var drink: DrinksModel
    var ingredients: [String] {
        dataLoader.listIngredients(drink: drink)
    }
    var getDrinks: () -> Void
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: drink.strDrinkThumb!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text(drink.strDrink ?? "Unknown Drink")
                            .font(.custom("PaytoneOne-Regular", size: 25))
                            .foregroundColor(Color("BWText"))
                        Text(drink.strCategory ?? "Unknown Category")
                            .font(.system(size: 25))
                            .foregroundColor(Color("BWText"))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        db.insertDrink(drink: drink)
                        getDrinks()
                        dismiss() 
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(5.0)
                    .foregroundColor(Color("BWAccent"))
                    .background(Color("LogoColor"))
                    .cornerRadius(5)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("LogoColor"))

                Text("Ingredients:")
                    .font(.custom("PaytoneOne-Regular", size: 25))
                    .foregroundColor(Color("BWText"))
                
                ForEach(ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .font(.system(size: 25))
                        .foregroundColor(Color("BWText"))
                }
            }
            .padding(.horizontal, 25.0)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
