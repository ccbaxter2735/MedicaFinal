//
//  AddRappelView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 17/03/2024.
//

import SwiftUI

struct addRappelView: View {
    // ------------- var addRappelView -----------------
    
    @ObservedObject var newRappel: TabRappel
    @ObservedObject var tabMedicament: TabMedicament
    @State var name: String = ""
    @State var state: [Bool] = Array(repeating: false, count: 7)
    @State var weekday: [Int] = []
    @State var hPrise: String = ""
    
    @State var tabMed: TabRappelMed = TabRappelMed()
    
    @State var selectedType: TypeRappel = TypeRappel.alarme
    @State var selectedTime = Date()
    
    func transformDateToHourMin(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return (dateFormatter.string(from: date))
    }
    
    @Environment(\.presentationMode) var presentationMode
    
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
            HStack {
                Text("Médicaments du rappel:")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                NavigationLink(destination: searchMedView(listMed: tabMedicament, tabMed: tabMed)) {
                    // MARK: vue d'ajout de rappel
                    Text("Ajouter médicament")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                ForEach(tabMed.rappelMed) { tab in
                    TabRappelMedView(med: tab)
                }
                .padding()
            }

            // choix type de rappel
//            HStack (alignment: .center) {
//                Text("Type de rappel:")
//                    .font(.headline)
//                    .fontWeight(.thin)
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.leading)
//                    .background(.gray.opacity(0.0))
//                Picker("test", selection: $selectedType) {
//                    ForEach(TypeRappel.Type) { opt in
//                        Text("\(opt.rawValue)")
//                    }
//                }
//            }
            
            // Bouton ajouter append données de newRappel vers tabRappel
            Spacer()
            Button() {
                newRappel.addRappel(name: name, weekday: weekday, hPrise: hPrise, tabMed: tabMed.rappelMed, typeRappel: selectedType)
                presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Ajouter rappel")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor).cornerRadius(10)
                }
        })
        .padding()
    }
}

#Preview {
    addRappelView(newRappel: TabRappel(), tabMedicament: TabMedicament())
}
