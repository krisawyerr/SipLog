//
//  ContentView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataLoader = DataLoader()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center) {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                        Text("SipLog")
                            .font(.custom("PaytoneOne-Regular", size: 25))
                            .foregroundColor(Color("LogoColor"))
                    }
                    
                    Text(dataLoader.currentDate)
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 10.0)
                    
                    Divider()
                    
                    Text("Sip of the Moment:")
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color("LogoColor"))
                        .padding(.vertical, 5.0)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        AsyncImage(url: URL(string: dataLoader.picSOTM().strDrinkThumb!)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(dataLoader.picSOTM().strDrink!)
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("BWText"))
                            .padding([.leading, .bottom, .trailing], 10.0)
                        
                    }
                    .background(Color("BWAccent"))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Divider()
                        .padding(.top)
                    
                    ExtractedView(title: "Vodka")
                    ExtractedView(title: "Gin")
                    ExtractedView(title: "Rum")
                    ExtractedView(title: "Tequila")
                    ExtractedView(title: "Whiskey")
                }
                .padding(.horizontal, 25.0)
                .padding(.vertical, 10.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}


#Preview {
    ContentView()
}

struct ExtractedView: View {
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

struct BaseDrinkListView: View {
    let base: String
    
    var body: some View {
        Text(base)
    }
}
