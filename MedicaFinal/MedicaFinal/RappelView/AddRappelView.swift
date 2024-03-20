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
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 15, content: {
                    VStack(alignment: .leading, content: {
                        Text("Titre du rappel:")
                            .font(.headline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .background(.gray.opacity(0.0))
                        Text("(donner un nom à votre rappel exemple: epilepsie)")
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .background(.gray.opacity(0.0))
                        TextField("", text: $name)
                            .padding(.horizontal, 10)
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    })
                    Divider()
                    VStack(alignment: .leading, content: {
                        Text("Jour(s) du rappel:")
                            .font(.headline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .background(.gray.opacity(0.0))
                        Text("(cochez le ou les jours auquels vous souhaitez être rappelé)")
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .background(.gray.opacity(0.0))
                        SelectionSem(state: $state, weekday: $weekday)
                        SelectionWE(state: $state, weekday: $weekday)
                    })
                    Divider()
                    HStack (alignment: .center) {
                        VStack (alignment: .leading){
                            Text("Heure du rappel:")
                                .font(.headline)
                                .fontWeight(.thin)
                                .foregroundColor(Color.black)
                                .background(.gray.opacity(0.0))
                            Text("(indiquez l'heure souhaité)")
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.leading)
                                .background(.gray.opacity(0.0))
                        }
                        TimePicker(selectedTime: $selectedTime)
                            .frame(height: 35)
                    }
                    Divider()
                    HStack {
                        Text("Médicaments du rappel:")
                            .font(.headline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .background(.gray.opacity(0.0))
                        Spacer()
                        NavigationLink(destination: searchMedView(listMed: tabMedicament, tabMed: tabMed)) {
                            // MARK: vue d'ajout de rappel
                            Text("Ajouter médicament")
                                .padding(10)
                                .foregroundColor(.white)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                    }

                    Divider()
                    VStack (alignment: .leading) {
                        Text("Liste des médicaments sélectionnés:")
                            .font(.headline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .background(.gray.opacity(0.0))
                        Text("(Veuillez ajouter vos dosages)")
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .background(.gray.opacity(0.0))
                        VStack {
                                ForEach(tabMed.rappelMed) { tab in
                                    TabRappelMedView(med: tab)
                                    Divider()
                                }
                                .padding(5)
                        }
                    }

                    Spacer()
                })
                .padding(.all, 15.0)
            }
            VStack(alignment: .center, content: {
                Button() {
                    newRappel.rappel.append(Rappel(name: name, weekday: weekday, hPrise: hPrise, tabMed: tabMed.rappelMed, typeRappel: TypeRappel.notification))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Ajouter rappel")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.accentColor).cornerRadius(10)
                }
            })
            .padding([.leading, .bottom, .trailing], 20.0)
            .navigationTitle("Créer nouveau rappel")
        }
        
    }

}

#Preview {
    addRappelView(newRappel: TabRappel(), tabMedicament: TabMedicament())
}
