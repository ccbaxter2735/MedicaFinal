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
    @EnvironmentObject var tabRappel: TabRappel
    
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
                        ForEach(tabRappel.sortFilterTabRappel()) { tab in
                            CheckRappelView(rapp: tab)
                        }
                        .padding()
                    }
                    .background(.thinMaterial)
                    Spacer()
                    NavigationLink(destination: addRappelView(newRappel: tabRappel)) {
                        // MARK: vue d'ajout de rappel
                        Text("Créer nouveau rappel")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                })
            .navigationTitle("Rappel")
            .background(.white)
        }
    }
}

#Preview {
    RappelView()
}
