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
    var radius = ((UIScreen.main.bounds.width - 56) / 7)
    
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

// MARK: affiche le titre des rappels avant la liste de medicament
struct RappTitleView: View {
    
    @ObservedObject var rapp: Rappel
    
    var body: some View {
        HStack (alignment: .top, spacing: 30, content: {
            Button(action: {
                rapp.finish = !rapp.finish
                rapp.validRappel()
            }, label: {
                CheckImageView(tabM: rapp.finish)
            })
            VStack (alignment: .leading, content: {
                Text("Penser à prendre à")
                    .font(.headline)
                Text(rapp.name)
                    .font(.subheadline)
            })
            Image(systemName: "alarm")
            VStack (alignment: .trailing){
                Text(rapp.hPrise)
                    .foregroundColor(rapp.checkRetard())
                    .background(.thinMaterial)
                if (rapp.checkRetard() == .red) {
                    Text("Retard")
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                }
            }
        })
    }
}

// MARK: vue par ligne de médicament rappelé
struct MedView: View {
    
    @ObservedObject var rapp: Rappel
    @ObservedObject var tabM: RappelMed
    
    var body: some View {
        HStack (alignment: .top, spacing: 30, content: {
            Button(action: {
                tabM.confirm = !tabM.confirm
                rapp.checkMedicament()
            }, label: {
                CheckImageView(tabM: tabM.confirm)
            })
            VStack (alignment: .leading) {
                if (tabM.confirm == true) {
                    Text(tabM.med.name)
                        .font(.caption)
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
                        .font(.caption)
                        .foregroundColor(.black)
                    HStack {
                        Text(String(tabM.dosage))
                            .font(.caption)
                        Text(tabM.med.typeAdmin.rawValue)
                            .font(.caption)
                        ForEach(0..<2) { _ in
                            Image(systemName: "pill") // Image à répéter
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                                .frame(width: 10) // Taille de l'image
                        }
                        .font(.caption)
                    }
                }
            }
            Spacer()
            Image(tabM.med.imgMed)
                .resizable()
                .frame(width: 50, height: 40)
            
        })
        .frame(minWidth: 0, maxWidth: 300, alignment: .leading)
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
    @State var dosage: Int
    var body: some View {
        VStack (alignment: .center, content: {
            ForEach(tabMed) { tab in
                HStack(alignment: .center, content: {
                    Text(tab.med.name)
                    intPicker(dosage: tab.dosage)
                })
                .padding(10)
            }
        })
    }
}

struct ListMedView: View {
    @ObservedObject var medicament: TabMedicament
    @State var tabMed: [RappelMed]
    var bool: [Bool] = Array(repeating: false, count: 4)
    var body: some View {
        //        ForEach (medicament.med.indices.map({$0}), id: \.1) { index, tab in
        //            HStack (alignment: .center, spacing: 10) {
        //                Button (action: {
        //                    bool[index] = !bool[index]
        //                    tabMed.append(RappelMed(med: index, dosage: 1))
        //                }, label: {
        //                    CheckImageView(tabM: bool[index])
        //                })
        Text("index.name")
        Spacer()
        Text("index.detailMed")
        //            }
        //        }
    }
}

struct searchMedView: View {
    @ObservedObject var listMed: TabMedicament
    @ObservedObject var tabMed: TabRappelMed
    @State var searchText = ""
    @State private var multiSelection = Set<UUID>()
    @State private var copytab: [Medicament] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(tabA, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Médicaments")
            .toolbar { EditButton() }
            
        }
        .searchable(text: $searchText, prompt: "rechercher médicament")
        Text("\(multiSelection.count) médicaments sélectionnés")
//        Button de retour arriere
        Button() {
//            copytab = Array(multiSelection)
//            ForEach(copytab) { copy in
//                tabMed.addNewRappelMed(new: copy)
//            }
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
    
    #Preview {
    //    RappTitleView(rapp: rappel[0])
    //    MedView(rapp: rappelTest[0], tabM: rappelTest[0].tabMed[0])
    //    CircleChoixJours(text: "Lun")
    //    CircledText(text: "lun", test: false)
        searchMedView(listMed: TabMedicament(), tabMed: TabRappelMed())
    }
