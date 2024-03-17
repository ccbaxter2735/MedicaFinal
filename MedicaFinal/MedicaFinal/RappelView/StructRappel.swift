//
//  StructRappel.swift
//  Medica
//
//  Created by Apprenant69 on 07/03/2024.
//

import Foundation
import UIKit
import SwiftUI

extension Array {
    func arrayByAppending(o: Element) -> [Element] {
        return self + [o]
    }
}

// ------------------------------ ENUMERATION --------------------------------------------
// MARK: enum type d'administration
enum TypeAdmin: String {
    case comprime = "comprimé(s)", sachet = "sachet(s)", pastille = "pastille(s)", dose = "dose(s)", pulverisation = "pulvérisation(s)"
}

// MARK: enum type de rappel
enum TypeRappel {
    case notification, alarme
}

// ------------------------------ STRUCTURE DE DONNEES -----------------------------------
struct TimePicker: UIViewRepresentable {
    @Binding var selectedTime: Date

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.timeChanged(_:)), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ datePicker: UIDatePicker, context: Context) {
        datePicker.date = selectedTime
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(selectedTime: $selectedTime)
    }

    class Coordinator: NSObject {
        @Binding var selectedTime: Date

        init(selectedTime: Binding<Date>) {
            _selectedTime = selectedTime
        }

        @objc func timeChanged(_ sender: UIDatePicker) {
            selectedTime = sender.date
        }
    }
}

// MARK: structure d'un médicament
struct Medicament: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    var detailMed: String
    var typeAdmin: TypeAdmin
    var imgTypeAdmin: String
    var imgMed: String
    var jourPrise: [Int]?
}

// ------------------------------ CLASSE DE DONNEES --------------------------------------
// MARK: tableau de medicament vide
class TabMedicament: ObservableObject {
    @Published var med: [Medicament] = []
    
    init() {
        self.med = baseDonneesMed
    }
    
    func sizeArray() -> Int {
        return self.med.count
    }
}

// MARK: tableau de rappel vide
class TabRappel: ObservableObject {
    @Published var rappel: [Rappel] = []
    
    init() {
        self.rappel = rappelTest
    }
    
    // MARK: filtre les rappels qui sont auj et les ordonnent par heure
    func sortFilterTabRappel() -> [Rappel] {
        self.rappel = self.rappel.filter {
            isDay(tabInt: $0.weekday) == true
        }
        self.rappel.sort {
            $0.hPrise < $1.hPrise
        }
        return self.rappel;
    }
    
    // MARK: filtre les rappels en fonction de du jour de rappel et le jour d'auj
    func filterTabRappel() -> [Rappel] {
        self.rappel = self.rappel.filter {
            isDay(tabInt: $0.weekday) == true
        }
        return self.rappel;
    }
    
    // MARK: ajoute un Rappel dans le tableau de Rappel
    func addRappel(name: String, weekday: [Int], hPrise: String, tabMed: [RappelMed], typeRappel: TypeRappel) {
        self.rappel.append(Rappel(name: name, weekday: weekday, hPrise: hPrise, tabMed: tabMed, color: .black, finish: false, typeRappel: TypeRappel.alarme))
    }
}

// MARK: class dosage medicament
class RappelMed: Identifiable, ObservableObject {
    var id = UUID()
    @Published var med: Medicament
    @Published var confirm: Bool
    @Published var dosage: Int
    
    init(id: UUID = UUID(), med: Medicament, confirm: Bool = false, dosage: Int) {
        self.id = id
        self.med = med
        self.confirm = confirm
        self.dosage = dosage
    }
}

// MARK: class de rappel (contient tableau de class medicament)
class Rappel: Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var weekday: [Int] // chaque jour de semaine est un int (1 = dimanche -> 7 = samedi)
    @Published var hPrise: String
    @Published var tabMed: [RappelMed]
    @Published var color: UIColor?
    @Published var finish: Bool
    @Published var typeRappel: TypeRappel
    @Published var isToday: Bool?
    
    init(id: UUID = UUID(), name: String, weekday: [Int], hPrise: String, tabMed: [RappelMed], color: UIColor = .black, finish: Bool = false, typeRappel: TypeRappel) {
        self.id = id
        self.name = name
        self.weekday = weekday
        self.hPrise = hPrise
        self.tabMed = tabMed
        self.color = color
        self.finish = finish
        self.typeRappel = typeRappel
    }
    
    // MARK: check if the whole medicament have been taken
    func checkMedicament() {
        for it in self.tabMed {
            if (it.confirm == false) {
                return
            }
        }
        self.finish = true
    }
    
    // MARK: verif si rappel en retard
    func checkRetard() -> Color {
        let today: Date = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        if (self.finish == true) {
            return .blue
        }
        if (self.hPrise < dateFormatter.string(from: today)) {
            return .red
        }
        return .blue
    }
    
    // MARK: valid all the medicament of the rappel
    func validRappel() {
        if (self.finish == true) {
            for it in self.tabMed {
                it.confirm = true
            }
        }
    }

    
    // MARK: func pour changer date en heure
    func transformDateToHourMin(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return (dateFormatter.string(from: date))
    }
}

// ------------------------------------ FONCTIONS ------------------------------------------
// MARK: find if rappel is today
func isDay(tabInt: [Int]) -> Bool {
    let myDate = Date.now
    let thisWeekday: Int = Calendar.current.component(.weekday, from: myDate)
    for tab in tabInt {
        if (thisWeekday == tab) {
            return true
        }
    }
    return false
}

// ------------------------------ EXEMPLE DE JEU DE DONNEES -------------------------------
// MARK: Example tab de medicament
var medicament: [Medicament] = [
    Medicament(name: "Doliprane 500mg", detailMed: "super medoc magnifique", typeAdmin: TypeAdmin.comprime, imgTypeAdmin: "comprime", imgMed: "Doliprane_500mg")
]

// MARK: Example tab de rappel
var rappelTest: [Rappel] = [
    Rappel(name: "Traitement epilepsie", weekday: [2, 3, 4, 5, 6], hPrise: "17:00", tabMed: [
        RappelMed(med: medicament[0], confirm: false, dosage: 2),
        RappelMed(med: medicament[0], confirm: false, dosage: 2),
        RappelMed(med: medicament[0], confirm: false, dosage: 2),
        RappelMed(med: medicament[0], confirm: false, dosage: 2)
    ], color: .black, finish: false, typeRappel: TypeRappel.alarme),
    Rappel(name: "Traitement epilepsie", weekday: [2, 3, 4, 5, 6], hPrise: "09:00", tabMed: [
        RappelMed(med: medicament[0], confirm: false, dosage: 2),
        RappelMed(med: medicament[0], confirm: false, dosage: 2),
        RappelMed(med: medicament[0], confirm: false, dosage: 2),
        RappelMed(med: medicament[0], confirm: false, dosage: 2)
    ], color: .black, finish: false, typeRappel: TypeRappel.alarme)
    
]

var baseDonneesMed: [Medicament] = [
    Medicament(name: "Doliprane", detailMed: "Anti-douleur", typeAdmin: TypeAdmin.comprime, imgTypeAdmin: "comprime", imgMed: "Doliprane_500mg"),
    Medicament(name: "Dafalgan", detailMed: "Anti-douleur", typeAdmin: TypeAdmin.comprime, imgTypeAdmin: "comprime", imgMed: "Doliprane_500mg"),
    Medicament(name: "Spasfon", detailMed: "Anti-spasmodique", typeAdmin: TypeAdmin.comprime, imgTypeAdmin: "comprime", imgMed: "Doliprane_500mg"),
    Medicament(name: "Derinox", detailMed: "Déboucheur nasale", typeAdmin: TypeAdmin.comprime, imgTypeAdmin: "comprime", imgMed: "Doliprane_500mg")
]
// dosage par demi !!! pb dosage + image a revoir