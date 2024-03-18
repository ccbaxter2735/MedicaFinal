//
//  SignInLogInView.swift
//  Medica
//
//  Created by Apprenant 38 on 12/03/2024.
//

import SwiftUI

struct SignInLogInView: View {
    @Binding var nb: Int
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                VStack {
                    Image("logo.medica")
                        .resizable()
                        . frame(width:228.3, height: 141.16)
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 20)
                    Text("Médica")
                        .font(.title2)
                        .foregroundColor(Color("AccentColor"))
                        .padding(.bottom, 8)
                    Text("Le bon traitement toujours au bon moment")
                        .padding(.bottom, 28)
                    
                    // Button(action: {}) {
                    NavigationLink(destination: {
                        logInView(nb: $nb)
                                   }, label:  {
                    Text("Continuer avec un compte")
                        .fontWeight(.heavy)
                        .frame(width:260, height: 11)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                })
                    //}
                    
                
                    Button(action: {}) {
                        Text("Continuer sans compte")
                            .fontWeight(.heavy)
                            .frame(width:260, height: 11)
                            .padding()
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(8)
                    }
                    
                    
                    
                    
                    
                    .onAppear() {
                        print("MainView Showing")
                    }
                }
            }
            }
        }
}
struct SignInLogInView_Preview: PreviewProvider {
    static var previews: some View {
        SignInLogInView(nb: .constant(0))
    }
}

//#Preview {
//    SignInLogInView()
//}
