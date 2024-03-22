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
    @StateObject var tabRappel: TabRappel = TabRappel()
    @State var tabMedicament: TabMedicament = TabMedicament()
    @State var nb: Int = 0

    // ---------- function RappelView ---------------
    func screenToday() -> String {
        let today: Date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.dateFormat = "dd MMMM - HH:mm"
        return (dateFormatter.string(from: today))
    }
    
    func sortFilterTabRappel(tabrappel: TabRappel) -> [Rappel] {
        let new: TabRappel = TabRappel()
        new.rappel = tabrappel.rappel.filter {
            isDay(tabInt: $0.weekday) == true
        }
        new.rappel.sort {
            $0.hPrise < $1.hPrise
        }
        return new.rappel;
    }

    // ---------- body RappelView ---------------
    var body: some View {
        
        NavigationStack {
                VStack (content: {
                    Text("Aujourd'hui : \(screenToday())")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    ScrollView {
                        VStack(spacing: 10, content: {
                            ForEach(sortFilterTabRappel(tabrappel: tabRappel)) { tab in
                                CheckRappelView(rapp: tab, tabRappel: tabRappel, nb: $nb)
                                    .padding(10)
                            }
                            if (nb == 1) {
                                CongratsView()
                                    .padding(.vertical, 8)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            }
                        })
                        
                    }
                    .background(.thinMaterial)
                    Spacer()
                    NavigationLink(destination: addRappelView(tabRappel: tabRappel, tabMedicament: tabMedicament)) {
                        // MARK: vue d'ajout de rappel
                        Text("Créer nouveau rappel")
                            .frame(width: 260, height: 11)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(8)

                    }
                    .padding([.leading, .bottom, .trailing], 20)
                })
            .navigationTitle("Rappel")
            .background(.white)
        }
    }
}

#Preview {
    RappelView(tabRappel: TabRappel(), tabMedicament: TabMedicament())
}
