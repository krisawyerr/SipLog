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
                    Text("Sip of the Moment:")
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color("LogoColor"))
                        .padding(.vertical, 5.0)
                    
                    NavigationLink(destination: DrinkInfoView(drink: dataLoader.picSOTM(), getDrinks: {})) {
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
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("LogoColor"))
                        .padding(.top)
                    
                    BasePreviewView(title: "Vodka")
                    BasePreviewView(title: "Gin")
                    BasePreviewView(title: "Rum")
                    BasePreviewView(title: "Tequila")
                    BasePreviewView(title: "Whiskey")
                }
                .padding(.horizontal, 25.0)
                .padding(.vertical, 10.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
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
                    Text(dataLoader.currentDate)
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
