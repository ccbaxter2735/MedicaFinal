//
//  ordoModel.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import Foundation

class Ordonnance : Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var dateEmission : String
    @Published var imgOrdonnance : String
    @Published var renouvellement : Int
    @Published var index : Int
    
    init(id: UUID = UUID(), dateEmission: String, imgOrdonnance: String, renouvellement: Int = 1, index: Int) {
        self.id = id
        self.dateEmission = dateEmission
        self.imgOrdonnance = imgOrdonnance
        self.renouvellement = renouvellement
        self.index = index
    }
    
}
