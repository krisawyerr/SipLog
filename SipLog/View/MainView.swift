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
                        Image(systemName: "1.circle")
                        Text("Screen 1")
                    }

                AllDrinksListView()
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Screen 2")
                    }

                ScreenThreeView()
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Screen 3")
                    }
            }
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
