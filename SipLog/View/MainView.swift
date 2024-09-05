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
        var body: some View {
            VStack {
                Text("Screen 3")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }


#Preview {
    MainView()
}
