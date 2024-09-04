//
//  BasePreviewView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import SwiftUI

struct BasePreviewView: View {
    @StateObject var dataLoader = DataLoader()
    
    var title: String
    var drinks: [DrinksModel] {
        dataLoader.fetchCocktails(base: title, amountOfItems: 5)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack() {
                Text("\(title) Cocktails")
                    .font(.custom("PaytoneOne-Regular", size: 25))
                    .foregroundColor(Color("LogoColor"))
                    .padding(.vertical, 5.0)
                    .lineLimit(1)
                Spacer()

                NavigationLink(destination: BaseDrinkListView(base: title)) {
                    Text("View All")
                        .foregroundColor(Color.gray)
                }
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(drinks) { drink in
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
                                Text(drink.strCategory ?? "Unknown Drink")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color("BWText"))
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                            }
                            .padding(.horizontal, 10.0)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                        }
                        .frame(width: 250, height: 100)
                        .background(Color("BWAccent"))
                        .cornerRadius(10)
                    }
                    
                }
            }
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BasePreviewView(title: "Gin")
}
