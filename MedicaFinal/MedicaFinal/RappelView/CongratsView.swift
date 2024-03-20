//
//  CongratsView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 19/03/2024.
//

import SwiftUI

// MARK: view de chaque rappel dans la RappelView
struct CongratsView: View {
    // ------------- var checkRappelView -----------------
    
    // ------------- body checkRappelView ----------------
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            HStack (spacing: 15){
                Image(systemName: "checkmark.circle.fill")
                Text("Félicitation")
            }
            .foregroundColor(.white)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Divider()
                .background(.white)
            VStack (alignment: .leading, spacing: 15){
                Text("Vous avez validé tous les rappels, BRAVO")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Il faut fêter ça ... avec une bonne bouteille")
                Text("(Attention si vous prenez des médicaments, risque pour la santé en cas d'ingestion d'alcool)")
                    .underline()
            }
            .foregroundColor(.white)

        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .frame(width: UIScreen.main.bounds.width - 10)
        .background(.accent)
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CongratsView()
}
