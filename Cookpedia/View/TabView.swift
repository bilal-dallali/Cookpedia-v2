//
//  TabView.swift
//  Cookpedia
//
//  Created by Bilal Dallali on 30/10/2024.
//

import SwiftUI

struct TabView: View {
    
    @State private var isHomeSelected: Bool = true
    @State private var isDiscoverSelected: Bool = false
    @State private var isMyRecipeSelected: Bool = false
    @State private var isMyProfileSelected: Bool = false
    
    var body: some View {
        ZStack {
            if isHomeSelected {
                HomePageView()
            } else if isDiscoverSelected {
                DiscoverPageView()
            } else if isMyRecipeSelected {
                MyRecipePageView()
            } else if isMyProfileSelected {
                ProfilePageView()
            }
            VStack {
                Spacer()
                VStack {
                    HStack(spacing: 19) {
                        Button {
                            isHomeSelected = true
                            isDiscoverSelected = false
                            isMyRecipeSelected = false
                            isMyProfileSelected = false
                        } label: {
                            VStack(spacing: 2) {
                                Image(isHomeSelected ? "house-selected" : "house")
                                Text("Home")
                                    .foregroundStyle(Color(isHomeSelected ? "Primary900" : "Greyscale500"))
                                    .font(.custom(isHomeSelected ? "Urbanist-Bold" : "Urbanist-Medium", size: 10))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Button {
                            isHomeSelected = false
                            isDiscoverSelected = true
                            isMyRecipeSelected = false
                            isMyProfileSelected = false
                        } label: {
                            VStack(spacing: 2) {
                                Image(isDiscoverSelected ? "discover-selected" : "discover")
                                Text("Discover")
                                    .foregroundStyle(Color(isDiscoverSelected ? "Primary900" : "Greyscale500"))
                                    .font(.custom(isDiscoverSelected ? "Urbanist-Bold" : "Urbanist-Medium", size: 10))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Button {
                            //
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundStyle(Color("Primary900"))
                                    .frame(width: 38, height: 38)
                                    .shadow(color: Color(red: 245/255, green: 72/255, blue: 74/255, opacity: 0.25), radius: 24, x: 4, y: 8)
                                Image(systemName: "plus")
                                    .foregroundColor(Color("MyWhite"))
                                    .frame(width: 12, height: 12)
                            }
                            .shadow(color: Color(red: 0.96, green: 0.28, blue: 0.29, opacity: 0.25), radius: 12, x: 4, y: 8)
                        }
                        
                        Button {
                            isHomeSelected = false
                            isDiscoverSelected = false
                            isMyRecipeSelected = true
                            isMyProfileSelected = false
                        } label: {
                            VStack(spacing: 2) {
                                Image(isMyRecipeSelected ? "recipe-selected" : "recipe")
                                Text("Home")
                                    .foregroundStyle(Color(isMyRecipeSelected ? "Primary900" : "Greyscale500"))
                                    .font(.custom(isMyRecipeSelected ? "Urbanist-Bold" : "Urbanist-Medium", size: 10))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Button {
                            isHomeSelected = false
                            isDiscoverSelected = false
                            isMyRecipeSelected = false
                            isMyProfileSelected = true
                        } label: {
                            VStack(spacing: 2) {
                                Image(isMyProfileSelected ? "profile-selected" : "profile")
                                Text("Profile")
                                    .foregroundStyle(Color(isMyProfileSelected ? "Primary900" : "Greyscale500"))
                                    .font(.custom(isMyProfileSelected ? "Urbanist-Bold" : "Urbanist-Medium", size: 10))
                            }
                        }
                        .frame(maxWidth: .infinity)

                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 5)
                    
                }
                .padding(.top, 8)
                .padding(.bottom, 29)
                .background {
                    Rectangle()
                        .fill(Color(red: 0.09, green: 0.1, blue: 0.13, opacity: 0.85))
                        
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    TabView()
}