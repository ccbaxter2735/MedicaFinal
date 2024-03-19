//
//  signInView.swift
//  Medica
//
//  Created by Apprenant 38 on 12/03/2024.
//

import SwiftUI

struct signInView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPW: String = ""
    @State var isOn = false
    @Binding var nb: Int
    
    var body: some View {
        NavigationStack {
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
                
                Text("S'inscrire")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
            }
            Spacer()
                HStack {
                    VStack {
                        Button(action: {
                            AccessibilityNotification.Announcement("Connection Google")
                                .post()
                        }) {
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
                        }
                        Text("Google")
                            .font(.caption)
                    }
                    .padding(.leading, 60)
                    Spacer()
                    
                    VStack {
                    Button(action: {
                        AccessibilityNotification.Announcement("Connection Apple")
                            .post()
                    }) {
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
                    }
                        Text("Apple")
                            .font(.caption)
                    }
                    Spacer()
                    
                    VStack {
                    Button(action: {
                        AccessibilityNotification.Announcement("Connection Facebook")
                            .post()
                    }) {
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
                    }
                        Text("Facebook")
                            .font(.caption)
                    }
                    Spacer()
                   
                }
               
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
                VStack(spacing: 8.0) {
                    inputFieldLogin(data: $username, title: "Identifiant")
                    inputFieldLogin(data: $email, title: "Email")
                    inputFieldLogin(data: $password, title: "Mot de passe")
                    inputFieldLogin(data: $confirmPW, title: "Confirmation du mot de passe")
                }.padding(.bottom, 12)
                HStack {
                    Toggle(isOn: $isOn) {
                        Text("Accepter les termes et conditions de Médica")
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
                HStack {
                    NavigationLink (destination: {
                        logInView(nb: $nb)
                            .navigationBarBackButtonHidden(true)
                        
                    }, label : {
                        
                       Text("Déjà un compte?")
                            .fontWeight(.thin)            // make the font thinner
                            . font(. system(size: 15))
                            .foregroundColor(Color.black)  // make the color blue
                        Text("Connectez-vous")
                             .fontWeight(.bold)            // make the font thinner
                             . font(.callout)
                             .foregroundColor(Color("AccentColor"))  // make the color blue
                            
                    })
                    // spacer to push text to the right
                    Spacer() // spacer to push text to the left
                }.padding(.top, 16)
                    .padding(.leading, 93)                // extrac space to the top to sign in button
                
               
                    
            }
        }
}

#Preview {
    signInView(nb: .constant(1))
}
