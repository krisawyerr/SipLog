//
//  MainView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/4/24.
//

import SwiftUI

struct MainView: View {
        var body: some View {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }

                AllDrinksListView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }

                ScreenThreeView()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")                    }
            }
            .accentColor(Color("LogoColor"))
            .navigationTitle("Details")
        }
    }

struct ScreenThreeView: View {
    var db = Database()
    
    @State var myDrinks: [MyDrinksModel] = []
    func getMyDrinks() {
        myDrinks = db.query()
    }
    
    var body: some View {
        VStack {
            ForEach(myDrinks) { drink in
                HStack {
                    Text(drink.strDrink)
                    Text("\(drink.id)")
                    Text(drink.idDrink)
                    Button(action: {
                        db.delete(drink: drink)
                        getMyDrinks()
                    }, label: {
                        Text("Delete")
                    })
                }
            }
        }
        .onAppear {
            getMyDrinks()
        }
    }
}


#Preview {
    MainView()
}
