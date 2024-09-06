//
//  MyDrinksView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import SwiftUI

struct Profile: View {
    var db = Database()
    
    @State var myDrinks: [MyDrinksModel] = []
    func getMyDrinks() {
        myDrinks = db.query()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Drinks Tried:")
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color("LogoColor"))
                        .padding(.vertical, 5.0)
                    Text("Favorite Liquor:")
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color("LogoColor"))
                        .padding(.vertical, 5.0)
                    
//                    ZStack {
//                        VStack(alignment: .leading, spacing: 10) {
//                            AsyncImage(url: URL(string: myDrinks[0].strDrinkThumb)) { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                            } placeholder: {
//                                ProgressView()
//                            }
//                            
//                            Text(myDrinks[0].strDrink)
//                                .font(.system(size: 25))
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color("BWText"))
//                                .padding([.leading, .bottom, .trailing], 10.0)
//                            
//                        }
//                        .background(Color("BWAccent"))
//                        .clipShape(RoundedRectangle(cornerRadius: 5))
//                        
////                        DrinkInfoButtonView(drink: myDrinks[0])
//                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("LogoColor"))
                        .padding(.top)
                    
                    NavigationLink(destination: MyDrinksView()) {
                        Text("View All")
                            .foregroundColor(Color.gray)
                    }
                    
//                    BasePreviewView(title: "Vodka")
//                    BasePreviewView(title: "Gin")
//                    BasePreviewView(title: "Rum")
//                    BasePreviewView(title: "Tequila")
//                    BasePreviewView(title: "Whiskey")
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
                    Text("Profile")
                        .font(.custom("PaytoneOne-Regular", size: 25))
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct MyDrinksView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    Profile()
}
