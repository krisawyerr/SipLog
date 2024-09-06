//
//  AllDrinksListView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import SwiftUI

struct AllDrinksListView: View {
    @StateObject var dataLoader = DataLoader()
    var db = Database()
    @State private var searchText = ""

    var filteredDrinks: [DrinksModel] {
        if searchText.isEmpty {
            return dataLoader.data
        } else {
            return dataLoader.data.filter { drink in
                drink.strDrink?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                        ForEach(filteredDrinks) { drink in
                            ZStack {
                                HStack(spacing: 0) {
                                    AsyncImage(url: URL(string: drink.strDrinkThumb ?? "")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                    }

                                    VStack(alignment: .leading) {
                                        Text(drink.strDrink ?? "Unknown Drink")
                                            .font(.custom("PaytoneOne-Regular", size: 15))
                                            .foregroundColor(Color("BWText"))
                                            .frame(maxWidth: .infinity)
                                        Text(drink.strCategory ?? "Unknown Category")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("BWText"))
                                            .frame(maxWidth: .infinity)
                                    }
                                    .padding(.horizontal, 10.0)
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                                }
                                .padding(.trailing)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .background(Color("BWAccent"))
                                .cornerRadius(10)
                                
                                DrinkInfoButtonView(drink: drink, getDrinks: {})
                            }
                        }
                }
                .padding(.horizontal, 25.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a drink")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                        Text("SipLog")
                            .font(.custom("PaytoneOne-Regular", size: 25))
                            .foregroundColor(Color("LogoColor"))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("All Cocktails")
                        .font(.custom("PaytoneOne-Regular", size: 17))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

#Preview {
    AllDrinksListView()
}
