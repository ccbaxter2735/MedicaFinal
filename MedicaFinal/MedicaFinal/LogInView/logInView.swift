//
//  logInView.swift
//  Medica
//
//  Created by Apprenant 38 on 11/03/2024.
//

import SwiftUI

struct logInView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isOn = false
    @Binding var nb: Int
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("AccentColor"))
                        .frame(width:500, height: 150)
                        .padding(.top, -90)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AccentColor"))
                        .frame(width:215, height: 100)
                        .rotationEffect(Angle(degrees: 10))
                        .padding(.top)
                        .padding(.leading, -180)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("AccentColor"))
                        .frame(width:215, height: 100)
                        .rotationEffect(Angle(degrees: -10))
                        .padding(.top)
                        .padding(.trailing, -180)
                    
                    Text("Se connecter")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                }
                
                HStack {
                    VStack {
                        Button(action: {
                            AccessibilityNotification.Announcement("Connection Google")
                                .post()
                        }) {
                            VStack {
                                Text("G")
                                    .frame(width:20, height: 20)
                                    .padding()
                                    .foregroundColor(Color("AccentColor"))
                                    .background(.white)
                                    .cornerRadius(50)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 50,
                                            style: .continuous
                                        )
                                        .stroke(Color("AccentColor"), lineWidth: 3)
                                    )
                                Text("Google")
                                    .font(.caption)
                            }
                        }
                
                    }
                    .padding(.leading, 60)
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            AccessibilityNotification.Announcement("Connection Apple")
                                .post()
                        }) {
                            VStack {
                                Text("")
                                    .font(.system(size: 32))
                                    .frame(width:20, height: 20)
                                    .padding()
                                    .foregroundColor(Color("AccentColor"))
                                    .background(.white)
                                    .cornerRadius(50)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 50,
                                            style: .continuous
                                        )
                                        .stroke(Color("AccentColor"), lineWidth: 3)
                                    )
                                
                                Text("Apple")
                                    .font(.caption)
                            }
                        }
                    }
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            AccessibilityNotification.Announcement("Connection Facebook")
                                .post()
                        }) {
                            VStack {
                                Text("F")
                                    .frame(width:20, height: 20)
                                    .padding()
                                    .foregroundColor(Color("AccentColor"))
                                    .background(.white)
                                    .cornerRadius(50)
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 50,
                                            style: .continuous
                                        )
                                        .stroke(Color("AccentColor"), lineWidth: 3)
                                    )
                                
                                Text("Facebook")
                                    .font(.caption)
                            }
                        }
                    }
                    Spacer()
                    
                }
                .padding(.top, 30)
                HStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        . frame(width:94, height: 2)
                        .foregroundColor(Color("AccentColor"))
                    Text("Ou")
                        .fontWeight(.bold)
                        .foregroundColor(Color("AccentColor"))
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        . frame(width:94, height: 2)
                        .foregroundColor(Color("AccentColor"))
                    
                }
//                HStack {
//                    Image(systemName: "lock")
//                        .resizable()
//                        .frame(width: 30, height: 40)
//                        .foregroundColor(Color("AccentColor"))
                    VStack(spacing: 8.0) {
                        inputFieldLogin(data: $username, title: "Identifiant ou adresse mail")
                        inputFieldLogin(data: $password, title: "Mot de passe")
                    }.padding(.bottom, 12)
//                }
                
                HStack {
                    Toggle(isOn: $isOn) {
                        Text("Rester connecté")
                            .font(.caption)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    
                    Spacer() // spacer to push text to the left
                }
                .padding(.leading, 60)
                .padding(.bottom, 20)// extrac space to the top to sign in button
                
                Button(action: {
                    AccessibilityNotification.Announcement("Se connecter")
                        .post()
                }) {
                    Text("Se connecter")
                    
                        .frame(width:260, height: 11)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                }
                Button(action: {nb += 1
                    AccessibilityNotification.Announcement("Continuer sans compte")
                        .post()}) {
                    Text("Continuer sans compte")
                    
                        .frame(width:260, height: 11)
                        .padding()
                        .foregroundColor(Color("AccentColor"))
                        .background(
                            RoundedRectangle(
                                cornerRadius: 8,
                                style: .continuous
                            )
                            .stroke(Color("AccentColor"), lineWidth: 2)
                            
                        )
                }

                HStack {
                    Text("Pas de compte?")
                        .fontWeight(.thin)            // make the font thinner
                        . font(. system(size: 15))
                        .foregroundColor(Color.black)  // make the color blue
                    NavigationLink (destination: {
                        signInView(nb: $nb)
                                  .navigationBarBackButtonHidden(true)
                    }, label : {
                        Text("Créez en un")
                            .fontWeight(.bold)            // make the font thinner
                            . font(.callout)
                            .foregroundColor(Color("AccentColor"))  // make the color blue
                        
                    })
                    // spacer to push text to the right
                    Spacer() // spacer to push text to the left
                }.padding(.top, 16)
                    .padding(.leading, 93)                // extrac space to the top to sign in button
                
                HStack {
                    // spacer to push text to the right
                    Button(action:{
                        AccessibilityNotification.Announcement("Mot de passe oublié?")
                            .post()
                    }) {
                        Text("Mot de passe oublié?")
                            .fontWeight(.thin)
                            . font(. system(size: 15))
                        
                    }
                    Spacer() // spacer to push text to the left
                }.padding(.top, 20)
                    .padding(.leading, 60)
                
            }
            Spacer()
        }
    }
}


#Preview {
    logInView(nb: .constant(0))
}
