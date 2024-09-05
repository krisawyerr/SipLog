//
//  DrinkInfoButtonView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import SwiftUI

struct DrinkInfoButtonView: View {
    @State private var isHalfScreenModalPresented = false
    var drink: DrinksModel
    
    var body: some View {
        Button(action: {
            isHalfScreenModalPresented = true
        }) {
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .sheet(isPresented: $isHalfScreenModalPresented) {
            DrinkInfoView(drink: drink)
                .presentationDetents([.fraction(0.8)])
        }
    }
}

#Preview {
    ContentView()
}
