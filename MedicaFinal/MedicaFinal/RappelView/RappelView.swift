//
//  RappelView.swift
//  Medica
//
//  Created by Apprenant69 on 11/03/2024.
//

import SwiftUI

// MARK: vue global de rappel
struct RappelView: View {
    // ------------- var RappelView -----------------
    var tabRappel: TabRappel = TabRappel()
    var tabMedicament: TabMedicament = TabMedicament()
    
    // ---------- function RappelView ---------------
    func screenToday() -> String {
        let today: Date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateFormat = "dd MMMM - HH:mm"
        return (dateFormatter.string(from: today))
    }
    
    // ---------- body RappelView ---------------
    var body: some View {
        NavigationStack {
                VStack (content: {
                    Text("Aujourd'hui : \(screenToday())")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    ScrollView {
                        VStack(content: {
                            ForEach(tabRappel.sortFilterTabRappel()) { tab in
                                CheckRappelView(rapp: tab, tabRappel: tabRappel)
                                    .padding(10)
                            }
                            if (tabRappel.testCongrats() == true) {
                                CongratsView()
                                    .padding(10)
                            }
                        })
                        
                    }
                    .background(.thinMaterial)
                    Spacer()
                    NavigationLink(destination: addRappelView(newRappel: tabRappel, tabMedicament: tabMedicament)) {
                        // MARK: vue d'ajout de rappel
                        Text("Créer nouveau rappel")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    .padding([.leading, .bottom, .trailing], 30)
                })
            .navigationTitle("Rappel")
            .background(.white)
        }
    }
}

#Preview {
    RappelView(tabRappel: TabRappel(), tabMedicament: TabMedicament())
}
