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

                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")                    }
            }
            .accentColor(Color("LogoColor"))
            .navigationTitle("Details")
        }
    }

#Preview {
    MainView()
}
