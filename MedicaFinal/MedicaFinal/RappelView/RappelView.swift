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
                        ForEach(tabRappel.sortFilterTabRappel()) { tab in
                            CheckRappelView(rapp: tab)
                        }
                        .padding()
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
                })
            .navigationTitle("Rappel")
            .background(.white)
        }
    }
}

#Preview {
<<<<<<< HEAD
    RappelView(tabRappel: TabRappel())
=======
    RappelView(tabRappel: TabRappel(), tabMedicament: TabMedicament())
}

// MARK: view de chaque rappel dans la RappelView
struct CheckRappelView: View {
    // ------------- var checkRappelView -----------------
    @ObservedObject var rapp: Rappel
    
    // ------------- body checkRappelView ----------------
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            RappTitleView(rapp: rapp)
            if (rapp.finish == false) {
                VStack (alignment: .leading, spacing: 5) {
                    ForEach (rapp.tabMed) { tab in
                        MedView(rapp: rapp, tabM: tab)
                    }
                }
            }
        }
        .padding(20)
        .frame(width: UIScreen.main.bounds.width - 10)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

// MARK: vue pour ajout nouveau rappel
struct addRappelView: View {
    // ------------- var addRappelView -----------------
    
    @ObservedObject var newRappel: TabRappel
    @ObservedObject var tabMedicament: TabMedicament
    @State var name: String = ""
    @State var state: [Bool] = Array(repeating: false, count: 7)
    @State var weekday: [Int] = []
    @State var hPrise: String = ""
    @State var tabMed: [RappelMed] = []
    @State var typeRappel: TypeRappel = TypeRappel.alarme
    
    @State var selectedTime = Date()
    
    // ------------- func addRappelView -----------------
    func transformDateToHourMin(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return (dateFormatter.string(from: date))
    }
    
    // ------------- body addRappelView ----------------
    var body: some View {
        VStack(alignment: .leading, content: {
            // --- input rappel information ---
            // nom du rappel
            inputFieldLogin(data: $name, title: "Intitulé du rappel")
            // choix des jours
            VStack (alignment: .leading) {
                Text("Jours des rappels")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                VStack (alignment: .leading) {
                    HStack {
                        CircleChoixJours(tabInt: $weekday, text: "lun", i: 2, test: $state[1])
                        CircleChoixJours(tabInt: $weekday, text: "mar", i: 3, test: $state[2])
                        CircleChoixJours(tabInt: $weekday, text: "mer", i: 4, test: $state[3])
                        CircleChoixJours(tabInt: $weekday, text: "Jeu", i: 5, test: $state[4])
                        CircleChoixJours(tabInt: $weekday, text: "Ven", i: 6, test: $state[5])
                    }
                    HStack {
                        CircleChoixJours(tabInt: $weekday, text: "Sam", i: 7, test: $state[6])
                        CircleChoixJours(tabInt: $weekday, text: "Dim", i: 1, test: $state[0])
                    }
                }
            }
            // choix de l'heure du rappel
            HStack (alignment: .center) {
                Text("Heure du rappel:")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                TimePicker(selectedTime: $selectedTime)
            }
            .padding()
            // tableau de med
<<<<<<< HEAD
          /*  NavigationLink {
                searchMedView(listMed: tabMedicament, tabMed: $tabMed)
=======
            NavigationLink {
//                searchMedView(listMed: tabMedicament, tabMed: $tabMed)
>>>>>>> delphine
            } label: {
                VStack {
                    Text("Liste des médicaments")
                        .font(.headline)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .background(.gray.opacity(0.0))
                    Text("Ajouter médicaments")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
            } */
            // Bouton ajouter append données de newRappel vers tabRappel
//            Spacer()
            NavigationLink(destination: RappelView(tabRappel: newRappel, tabMedicament: tabMedicament)) {
                Text("Ajouter rappel")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }.gesture(TapGesture().onEnded { self.newRappel.addRappel(name: name, weekday: weekday, hPrise: hPrise, tabMed: tabMed, typeRappel: typeRappel)
            })
                           
//            Button(action: {
//                self.newRappel.addRappel(name: name, weekday: weekday, hPrise: hPrise, tabMed: tabMed, typeRappel: typeRappel)
//
//            }) {
//                Text("Ajouter rappel")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(Color.accentColor)
//                    .cornerRadius(10)
//            }
        })
    }
>>>>>>> nayeff
}
