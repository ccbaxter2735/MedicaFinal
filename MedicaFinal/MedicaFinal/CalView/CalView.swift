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
    
   
        @State private var singleSelection: UUID?
        @State private var selectedDate: Date = Date()
  let dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationStack {
            VStack{
    
                DatePicker("Sélectionnez une date", selection: $selectedDate,  displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .padding()
                    .fontWeight(.semibold)
                // rajouter if (condition) avec 4 tableaux selon la date (selectedDate)
                    
//                   
//                        List(cals) { cal in
//                            CalView(cal: cal)
                
                switch Int(dayFromDate(selectedDate)) {
                case 24: List(selection: $singleSelection) {
                    ForEach(rapLists) { rap in
                        Section(header: Text("Rappel \(rap.name)")) {
                            ForEach(rap.medi) { medi in
                                Text(medi.name)
                            }
                        }
                    }
                };
                case 25 :List(selection: $singleSelection) {
                    ForEach(rap2Lists) { rap2 in
                        Section(header: Text("Rappel \(rap2.name)")) {
                            ForEach(rap2.medi) { medi in
                                Text(medi.name)
                            }
                        }
                    }
                };
                case 26: List(selection: $singleSelection) {
                    ForEach(rap3Lists) { rap3 in
                        Section(header: Text("Rappel \(rap3.name)")) {
                            ForEach(rap3.medi) { medi in
                                Text(medi.name)
                            }
                        }
                    }
                };
                case 27: List(selection: $singleSelection) {
                    ForEach(rap4Lists) { rap4 in
                        Section(header: Text("Rappel \(rap4.name)")) {
                            ForEach(rap4.medi) { medi in
                                Text(medi.name)
                            }
                        }
                    }
                };
                default: List(selection: $singleSelection) {
                    ForEach(rapLists) { rap in
                        Section(header: Text("Rappel \(rap.name)")) {
                            ForEach(rap.medi) { medi in
                                Text(medi.name)
                            }
                        }
                    }
                };
                }
                    
                    
                
                
            }
            .navigationTitle("Calendrier")
//            .background(.white)
        }
        
    }
    func dayFromDate(_ date: Date) -> String {
            dateFormatter.dateFormat = "dd"
            return dateFormatter.string(from: date)
        }
    }
#Preview {
    CalView()
}
