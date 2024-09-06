//
//  DrinkInfoView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import SwiftUI

struct DrinkInfoView: View {
    @Environment(\.presentationMode) var presentationMode
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 5.0)
                            .frame(height: 25)
                            .foregroundColor(Color("LogoColor"))
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                        Text("SipLog")
                            .font(.custom("PaytoneOne-Regular", size: 25))
                            .foregroundColor(Color("LogoColor"))
                    }
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
