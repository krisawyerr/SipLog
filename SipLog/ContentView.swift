//
//  ContentView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    let items1 = Array(1...10) // Sample data
    let items2 = Array(11...20) // Sample data
    let items3 = Array(21...30) // Sample data
    
    var body: some View {
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
                
                Text("September 3")
                    .font(.custom("PaytoneOne-Regular", size: 25))
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 10.0)
                
                Divider()
                
                Text("Sip of the Moment:")
                    .font(.custom("PaytoneOne-Regular", size: 25))
                    .foregroundColor(Color("LogoColor"))
                    .padding(/*@START_MENU_TOKEN@*/.vertical, 5.0/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 10) {
                    AsyncImage(url: URL(string: "https://www.nortekgroup.com/assets/images/Waves.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    
                    Text("Jack Rose Cocktail")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("BWText"))
                        .padding([.leading, .bottom, .trailing], 10.0)
                }
                .background(Color("BWAccent"))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Divider()
                    .padding(.top)
                
                ExtractedView(items: items1, title: "Vodka Cocktails")
                ExtractedView(items: items2, title: "Gin Cocktails")
                ExtractedView(items: items3, title: "Rum Cocktails")
                ExtractedView(items: items2, title: "Tequila Cocktails")
                ExtractedView(items: items3, title: "Whiskey Cocktails")
            }
            .padding(.horizontal, 25.0)
            .padding(.vertical, 10.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var items: [Int]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.custom("PaytoneOne-Regular", size: 25))
                .foregroundColor(Color("LogoColor"))
                .padding(.vertical, 5.0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(items, id: \.self) { item in
                        VStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .cornerRadius(10)
                            
                            Text("Item \(item)")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        .frame(width: 150)
                        .background(Color.gray)
                        .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
