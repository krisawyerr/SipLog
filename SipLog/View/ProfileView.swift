//
//  MyDrinksView.swift
//  SipLog
//
//  Created by Kris Sawyerr on 9/5/24.
//

import SwiftUI

struct ProfileView: View {
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
                        .padding(.top, 5.0)
                    Text("\(myDrinks.count) Drinks Tried")
                        .font(.system(size: 25))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 5.0)
                    NavigationLink(destination: MyDrinksView()) {
                        HStack {
                            Text("Drinks Tried")
                                .foregroundColor(Color("LogoColor"))
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color("LogoColor"))
                        }
                        .padding(.all, 25.0)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color("BWAccent"))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    }
                    .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                    
                    NavigationLink(destination: NotTriedDrinksView()) {
                        HStack {
                            Text("Drinks Not Tried")
                                .foregroundColor(Color("LogoColor"))
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(Color("LogoColor"))
                        }
                        .padding(.all, 25.0)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color("BWAccent"))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    }
                    .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal, 25.0)
                .padding(.vertical, 10.0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .onAppear {
                getMyDrinks()
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

#Preview {
    ProfileView()
}
