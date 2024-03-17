//
//  splashScreenView.swift
//  Medica
//
//  Created by Apprenant 38 on 12/03/2024.
//

import SwiftUI

struct splashScreenView: View {
    
    @State var isActive: Bool = false
    @State private var showDetails = false
    var body: some View {
        
       
        ZStack {
           
            Rectangle()
            .fill(Color("AccentColor"))
            .frame(width:410, height: 790)
           
            if self.isActive {
                logInView()
            } else {
                
                VStack {
                    
                    Image("logo.medica")
                        .resizable()
                        .scaledToFit()
                        .frame(width:296.31, height: 190.75)
                    Text("Médica")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                    
                }
            }
        }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline:.now() + 2.5) {
                        withAnimation {
                            self.isActive = true
                            
                            
                        
                    }
            }
        }
        .background(Color("AccentColor"))
    }
    

}
struct splashScreenView_Preview: PreviewProvider  {
    static var previews: some View {
        splashScreenView()
    }
}

//#Preview {
   // splashScreenView()
//}
