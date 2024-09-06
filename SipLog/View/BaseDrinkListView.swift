//
//  BaseDrinkListView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import SwiftUI

struct BaseDrinkListView: View {
    @Environment(\.presentationMode) var presentationMode
    var dataLoader = DataLoader()
    var db = Database()
    @State var searchText = ""
    let base: String
    
    var drinks: [DrinksModel] {
        dataLoader.filterDrinks(data: dataLoader.fetchCocktails(base: base), searchText: searchText)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                LazyVStack {
                    ForEach(drinks, id: \.idDrink) { drink in
                        NavigationLink(destination: DrinkInfoView(drink: drink, getDrinks: {})) {
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
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity)
                                    Text(drink.strCategory ?? "Unknown Category")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color("BWText"))
                                        .multilineTextAlignment(.center)
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
                        }
                    }
                }
                .padding(.horizontal, 25.0)
            }
        }
        .navigationBarBackButtonHidden(true)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a drink")
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
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("\(base) Cocktails")
                    .font(.custom("PaytoneOne-Regular", size: 17))
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#Preview {
//    BaseDrinkListView(base: "Gin")
    MainView()
}
