//
//  CalendarInfo.swift
//  MedicaFinal
//
//  Created by Apprenant 38 on 19/03/2024.
//

import Foundation

struct Cal: Identifiable {
    let id = UUID()
    let name: String
}
struct MedList: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }


    struct RapList: Identifiable {
        let name: String
        let medi: [MedList]
        let id = UUID()
    }


    let rapLists: [RapList] = [
        RapList(name: "Epilepsie",
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

struct MedList2: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }


    struct RapList2: Identifiable {
        let name: String
        let medi: [MedList2]
        let id = UUID()
    }


     let rap2Lists: [RapList2] = [
        RapList2(name: "Epilepsi",
                medi: [MedList2(name: "Dépakine"),
                       MedList2(name: "Carbamazéphine") ]),
        RapList2(name: "Insuffisance cardiaque",
                medi: [MedList2(name: "Acuitel"),
                       MedList2(name: "Triatec")]),
        RapList2(name: "Tension",
                medi: [MedList2(name: "Aténolol")]),
        RapList2(name: "Anémie",
                medi: [MedList2(name: "Fer")])
    ]

struct MedList3: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }


    struct RapList3: Identifiable {
        let name: String
        let medi: [MedList3]
        let id = UUID()
    }


     let rap3Lists: [RapList3] = [
        RapList3(name: "Epilepsi",
                medi: [MedList3(name: "Valproate de sodium"),
                       MedList3(name: "Trileptal")]),
        RapList3(name: "Insuffisance cardiaque",
                medi: [MedList3(name: "Acuitel"),
                       MedList3(name: "Triatec")]),
        RapList3(name: "Tension",
                medi: [MedList3(name: "Aténolol")])
    ]


struct MedList4: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }


    struct RapList4: Identifiable {
        let name: String
        let medi: [MedList4]
        let id = UUID()
    }


    let rap4Lists: [RapList4] = [
        RapList4(name: "Epilepsi",
                medi: [MedList4(name: "Gabritil"),
                       MedList4(name: "Valproate de sodium"),
                       MedList4(name: "Trileptal")]),
        RapList4(name: "Douleur",
                medi: [MedList4(name: "Dafalgan"),
                       MedList4(name: "Morphine")]),
        RapList4(name: "Insuffisance cardiaque",
                medi: [MedList4(name: "Acuitel"),
                       MedList4(name: "Triatec")]),
        RapList4(name: "Anémie",
                medi: [MedList4(name: "Fer")])
    ]


