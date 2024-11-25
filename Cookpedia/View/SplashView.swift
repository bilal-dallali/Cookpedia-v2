//
//  SplashView.swift
//  Cookpedia
//
//  Created by Bilal Dallali on 14/11/2024.
//

import SwiftUI
import SwiftData

struct SplashView: View {
    
    @State private var isRotating: Bool = false
    
    @State private var redirectHomePage: Bool = false
    @State private var redirectWelcomePage: Bool = false
    let sessionDescriptor = FetchDescriptor<UserSession>(predicate: #Predicate { $0.isRemembered == true })
    
    @StateObject private var apiPostManager = APIPostRequest()
    @Environment(\.modelContext) private var context: ModelContext
    
    var body: some View {
        VStack(spacing: 184) {
            Spacer()
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Cookpedia")
                    .foregroundStyle(Color("MyWhite"))
                    .font(.custom("Urbanist-Bold", size: 48))
            }
            Image("modal-loader")
                .resizable()
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                        isRotating = true
                    }
                }
        }
        .ignoresSafeArea(.all)
        .padding(.bottom, 108)
        .frame(maxWidth: .infinity)
        .background(Color("Dark1"))
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let _ = try? context.fetch(sessionDescriptor).first {
                    print("Session trouvée - Redirection vers TabView")
                    print("session desc: \(sessionDescriptor)")
                    redirectHomePage = true
                } else {
                    print("Aucune session avec 'Se souvenir de moi' trouvée - Redirection vers WelcomeView")
                    redirectWelcomePage = true
                }
            }
        }
        .navigationDestination(isPresented: $redirectHomePage) {
            TabView()
        }
        .navigationDestination(isPresented: $redirectWelcomePage) {
            WelcomeView()
        }

    }
}

#Preview {
    SplashView()
}
