//
//  CalView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 17/03/2024.
//

import SwiftUI
//import EventKit
//import EventKitUI

struct CalView: View {
    
    struct MedList: Hashable, Identifiable {
            let name: String
            let id = UUID()
        }


        struct RapList: Identifiable {
            let name: String
            let medi: [MedList]
            let id = UUID()
        }


        private let rapLists: [RapList] = [
            RapList(name: "Epilepsi",
                    medi: [MedList(name: "Dépakine"),
                               MedList(name: "Carbamazéphine"),
                               MedList(name: "Valproate de sodium"),
                               MedList(name: "Trileptal")]),
            RapList(name: "Douleur",
                    medi: [MedList(name: "Dolipran"),
                               MedList(name: "Dafalgan"),
                               MedList(name: "Morphine")]),
            RapList(name: "Insuffisance cardiaque",
                    medi: [MedList(name: "Acuitel"),
                               MedList(name: "Périndopril"),
                               MedList(name: "Ramipril"),
                               MedList(name: "Triatec")]),
            RapList(name: "Tension",
                    medi: [MedList(name: "Aténolol")]),
            RapList(name: "Anémie",
                    medi: [MedList(name: "Fer")])
        ]


        @State private var singleSelection: UUID?
        @State private var selectedDate: Date = Date()
  
    var body: some View {
        NavigationStack {
            VStack{
    
                DatePicker("Sélectionnez une date", selection: $selectedDate,  displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()
                    .fontWeight(.semibold)
                
                    
//                   
//                        List(cals) { cal in
//                            CalView(cal: cal)
                        
                List(selection: $singleSelection) {
                    ForEach(rapLists) { rap in
                        Section(header: Text("Rappel \(rap.name)")) {
                            ForEach(rap.medi) { medi in
                                Text(medi.name)
                            }
                        }
                    }
                }
                
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 100, height: 100)
            }
            .navigationTitle("Calendar")
//            .background(.white)
        }
        
    }
        
    }
#Preview {
    CalView()
}
