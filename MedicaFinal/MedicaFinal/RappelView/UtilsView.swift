//
//  UtilsView.swift
//  Medica
//
//  Created by Apprenant69 on 11/03/2024.
//

import SwiftUI

// MARK: affiche soit cercle vide ou cercle validé
struct CheckImageView: View {
    
    var tabM: Bool
    
    var body: some View {
        if (tabM == false) {
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
        } else {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.accentColor)
        }
    }
}

struct CircledText: View {
    
    let text: String
    var test: Bool
    var radius = ((UIScreen.main.bounds.width - 56) / 6)
    
    var body: some View {
        if (test == false) {
            ZStack {
                Circle().strokeBorder().frame(width: radius, height: radius)
                Text(text)
                    .padding()
                    .foregroundColor(Color.black)
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
            }
        } else {
            ZStack {
                
                Circle()
                    .foregroundColor(Color.accentColor)
                    .frame(width: radius, height: radius)
                Text(text)
                    .padding()
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct CircleChoixJours: View {
    @Binding var tabInt: [Int]
    var newTab: [Int] = []
    var text: String
    var i: Int
    @Binding var test: Bool
    
    var body: some View {
        Button(action: {
            test = !test
            if (tabInt.contains(i)) {
                tabInt = tabInt.filter {$0 != i}
            } else {
                tabInt.append(i)
            }
        }, label: {
            CircledText(text: text, test: test)
        })
    }
}

// MARK: affiche la selection jours de semaine
struct SelectionSem: View {
    @Binding var state: [Bool]
    @Binding var weekday: [Int]
    
    var body: some View {
        HStack {
            CircleChoixJours(tabInt: $weekday, text: "Lun", i: 2, test: $state[1])
            Spacer()
            CircleChoixJours(tabInt: $weekday, text: "Mar", i: 3, test: $state[2])
            Spacer()
            CircleChoixJours(tabInt: $weekday, text: "Mer", i: 4, test: $state[3])
            Spacer()
            CircleChoixJours(tabInt: $weekday, text: "Jeu", i: 5, test: $state[4])
            Spacer()
            CircleChoixJours(tabInt: $weekday, text: "Ven", i: 6, test: $state[5])
        }
    }
}

// MARK: affiche la selection jours de weekend
struct SelectionWE: View {
    @Binding var state: [Bool]
    @Binding var weekday: [Int]
    
    var body: some View {
        HStack {
            CircleChoixJours(tabInt: $weekday, text: "Sam", i: 7, test: $state[6])
            CircleChoixJours(tabInt: $weekday, text: "Dim", i: 1, test: $state[0])
        }
    }
}

// MARK: affiche le titre des rappels avant la liste de medicament
struct RappTitleView: View {
    
    @ObservedObject var rapp: Rappel
    @ObservedObject var tabRappel: TabRappel
    @Binding var nb: Int
    
    func testCongratulation (tabRappel: TabRappel) -> Int {
        for tab in tabRappel.rappel {
            if (tab.finish == false) {
                return 0
            }
        }
        return 1
    }

    var body: some View {
        VStack {
            HStack (alignment: .top, spacing: 20, content: {
                Button(action: {
                    rapp.finish = !rapp.finish
                    rapp.validRappel()
                    nb = testCongratulation(tabRappel: tabRappel)
                }, label: {
                    CheckImageView(tabM: rapp.finish)
                })
                VStack (alignment: .leading, content: {
                    Text("Pensez à prendre à")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(rapp.colorT)
//                        .fontWeight(.heavy)
                    Text(rapp.name)
                        .font(.headline)
                        .foregroundColor(rapp.colorT)
                        .fontWeight(.heavy)
                })
                Spacer()
                HStack {
                    Image(systemName: "alarm")
                    VStack (alignment: .trailing){
                        if (rapp.finish == true) {
                            Text("Validé")
                                .foregroundColor(.accentColor)
                                .background(.thinMaterial)
                        } else {
                            Text(rapp.hPrise)
                                .foregroundColor(rapp.checkRetard())
                                .background(.thinMaterial)
                            if (rapp.checkRetard() == .red) {
                                Text("Retard")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.red)
                            }
                        }
                    }
                }
            })
        }
        .frame(width: UIScreen.main.bounds.width - 40)
    }
}

// MARK: vue par ligne de médicament rappelé
struct MedView: View {
    
    @ObservedObject var rapp: Rappel
    @ObservedObject var tabM: RappelMed
    @ObservedObject var tabRappel: TabRappel
    @Binding var nb: Int
    
    func testCongratulation (tabRappel: TabRappel) -> Int {
        for tab in tabRappel.rappel {
            if (tab.finish == false) {
                return 0
            }
        }
        return 1
    }
    
    var body: some View {
        VStack {
            Divider()
                .padding(5)
            HStack (alignment: .center, spacing: 30, content: {
                Button(action: {
                    tabM.confirm = !tabM.confirm
                    rapp.checkMedicament()
                    nb = testCongratulation(tabRappel: tabRappel)                }, label: {
                    CheckImageView(tabM: tabM.confirm)
                })
                VStack (alignment: .leading, spacing: 2) {
                    if (tabM.confirm == true) {
                        Text(tabM.med.name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .strikethrough()
                        HStack {
                            Text(String(tabM.dosage))
                                .font(.caption)
                                .foregroundColor(.gray)
                                .strikethrough()
                            Text(tabM.med.typeAdmin.rawValue)
                                .font(.caption)
                                .foregroundColor(.gray)
                                .strikethrough()
                        }
                    } else {
                        Text(tabM.med.name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        HStack {
                            Text(String(tabM.dosage))
                                .font(.caption)
                            Text(tabM.med.typeAdmin.rawValue)
                                .font(.caption)
                            HStack (alignment: .center, spacing: 2){
                                ForEach(0..<tabM.dosage) { index in
                                    Image(tabM.med.imgTypeAdmin) // Image à répéter
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 20) // Taille de l'image
                                }
                                .font(.caption)
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                }
                Spacer()
                Image(tabM.med.imgMed)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 35)
                
            })
        }
        .frame(width: UIScreen.main.bounds.width - 50)
    }
}

struct intPicker: View {
    @State var dosage: Int = 1
    var ints: [Int] = Array(1...10)
    var body: some View {
        Picker("dosage: ", selection: $dosage) {
            ForEach(ints, id: \.self) { nb in
                Text("\(dosage)")
            }
        }
    }
}

struct showTabMedView: View {
    @State var tabMed: [RappelMed]
    @State var dosage: Int = 1
    var body: some View {
        VStack (alignment: .center, content: {
            ForEach(tabMed) { tab in
                HStack(alignment: .center, content: {
                    Text(tab.med.name)
                    Spacer()
                    intPicker(dosage: tab.dosage)
                })
                .padding(10)
            }
        })
    }
}

// MARK: Modal de selection de medicament dans base de données
struct searchMedView: View {
    @ObservedObject var listMed: TabMedicament
    @ObservedObject var tabMed: TabRappelMed
    @State var searchText = ""
    @State private var multiSelection = Set<UUID>()
    @State var tabString: [Medicament] = []
    @State private var copytab: [Medicament] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: Méthode pour récupérer les noms des éléments sélectionnés
    private func selectedMedNames(meds: [Medicament], multiSelection: Set<UUID>) -> [Medicament] {
        var selectedNames: [Medicament] = []
        for med in meds {
            if multiSelection.contains(med.id) {
                selectedNames.append(Medicament(name: med.name, detailMed: med.imgMed, typeAdmin: med.typeAdmin, imgTypeAdmin: med.imgTypeAdmin, imgMed: med.imgMed))
            }
        }
        return selectedNames
    }
    
    var body: some View {
        NavigationView {
            List(tabA, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Médicaments")
            .environment(\.editMode, .constant(EditMode.active))
            
        }
        .searchable(text: $searchText, prompt: "rechercher médicaments")
        Text("\(multiSelection.count) médicaments sélectionnés")
//        Button de retour arriere
        Button() {
            tabString = selectedMedNames(meds: listMed.med, multiSelection: multiSelection)
            for medic in tabString {
                tabMed.addNewRappelMed(new: medic)
            }
            presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Ajouter médicaments")
                .padding()
                .foregroundColor(.white)
                .background(Color.accentColor).cornerRadius(10)
            }
        
    }
    var tabA: [Medicament] {
        if searchText.isEmpty {
            return listMed.med
        } else {
            return listMed.med.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
    
//    #Preview {
////        RappTitleView(rapp: rappelTest[0])
////        MedView(rapp: rappelTest[0], tabM: rappelTest[0].tabMed[3], tabRappel: TabRappel())
//    //    CircleChoixJours(text: "Lun")
//    //    CircledText(text: "lun", test: false)
////        searchMedView(listMed: TabMedicament(), tabMed: TabRappelMed())
//    }
