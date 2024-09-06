//
//  NotTriedDrinksView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import SwiftUI

struct NotTriedDrinksView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var searchText = ""
    var dataLoader = DataLoader()
    @State var drinks: [DrinksModel] = []
    
    func getDrinks() {
        drinks = dataLoader.filterDrinks(data: dataLoader.fetchNotTriedCocktails(), searchText: searchText)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                LazyVStack {
                    ForEach(drinks, id: \.idDrink) { drink in
                        NavigationLink(destination: DrinkInfoView(drink: drink, getDrinks: {})) {
//                        ZStack {
                            HStack(spacing: 0) {
                                AsyncImage(url: URL(string: drink.strDrinkThumb!)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(drink.strDrink!)
                                        .font(.custom("PaytoneOne-Regular", size: 15))
                                        .foregroundColor(Color("BWText"))
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity)
                                    Text(drink.strCategory!)
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
                            
//                            DrinkInfoButtonView(drink: drink) {
//                                getDrinks()
//                            }
                        }
                    }
                }
                .padding(.horizontal, 25.0)
                .padding(.top, 10.0)
            }
        }
        .onAppear {
            getDrinks()
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
                Text("Drinks Not Tried")
                    .font(.custom("PaytoneOne-Regular", size: 17))
                    .foregroundColor(Color.gray)
            }
        }
    }
}


#Preview {
    ProfileView()
}

