//
//  inputFieldLogin.swift
//  Medica
//
//  Created by Apprenant 38 on 11/03/2024.
//

import SwiftUI

struct inputFieldLogin: View {
    @Binding var data: String
        var title: String?
    
    var body: some View {
        VStack {
            
            HStack {                    // HStack for the text
              Text(title ?? "Input")
                .font(.headline)
                .fontWeight(.thin)      // making the text small
                .foregroundColor(Color.black)    // and gray
                .multilineTextAlignment(.leading)
                .background(.gray.opacity(0.0))     // adding some white background
              Spacer()                  // pushing the text to the left
            } . padding(.leading, 50)
            TextField("", text: $data)
              .padding(.horizontal, 10)
              .frame(width:290, height: 40)
              .overlay(
                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                    .stroke(Color.gray, lineWidth: 1)
              )
            .padding(.leading, 8)
            
          }.padding(4)
        }

    
}
struct InputFieldLogIn_Previews: PreviewProvider {
    @State static var data: String = ""
    static var previews: some View {
        inputFieldLogin(data: $data, title: "Password")
       
    }
}
// Struct pour la coche 'Rester connecté' sur la page signInView
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}

//#Preview {
  //  inputFieldLogin()
//}
