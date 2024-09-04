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
    @State var searchText = ""
    let base: String
    
    var drinks: [DrinksModel] {
        dataLoader.filterDrinks(data: dataLoader.fetchCocktails(base: base), searchText: searchText)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(base) Cocktails")
                    .font(.custom("PaytoneOne-Regular", size: 25))
                    .foregroundColor(Color("LogoColor"))
                    .padding(.bottom, 10.0)
                
                VStack {
                    ForEach(drinks, id: \.idDrink) { drink in
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
                            
                            Button(action: {
                                print("Custom button action")
                            }) {
                                Image(systemName: "plus")
                            }
                            .padding(5.0)
                            .foregroundColor(Color("BWAccent"))
                            .background(Color("LogoColor"))
                            .cornerRadius(5)
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
            .padding(.vertical, 10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .searchable(text: $searchText, prompt: "Search for a drink.")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.gray)
                    }
                }
            }
            
            ToolbarItem(placement: .principal) {
                HStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 25)
                    Text("SipLog")
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color("LogoColor"))
                }
                .frame(maxWidth: .infinity)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("Custom button action")
                }) {
                    Image(systemName: "plus")
                }
                .foregroundColor(Color("LogoColor"))
            }
        }
    }
}

//#Preview {
//    BaseDrinkListView(base: "Gin")
//}
