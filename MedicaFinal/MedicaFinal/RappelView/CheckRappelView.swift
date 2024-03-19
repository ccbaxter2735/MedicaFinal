//
//  CheckRappelView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 17/03/2024.
//

import SwiftUI

// MARK: view de chaque rappel dans la RappelView
struct CheckRappelView: View {
    // ------------- var checkRappelView -----------------
    @ObservedObject var rapp: Rappel
    
    // ------------- body checkRappelView ----------------
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            RappTitleView(rapp: rapp)
            if (rapp.finish == false) {
                VStack (spacing: 5) {
                    ForEach (rapp.tabMed) { tab in
                        MedView(rapp: rapp, tabM: tab)
                    }
                }
            }
        }
        .padding(20)
        .frame(width: UIScreen.main.bounds.width - 10)
        .background(rapp.color)
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CheckRappelView(rapp: rappelTest[0])
}
