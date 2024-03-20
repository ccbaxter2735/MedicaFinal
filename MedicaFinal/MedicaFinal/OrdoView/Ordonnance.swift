//
//  ordoModel.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import Foundation

struct Ordonnance : Identifiable {
    var id = UUID()
    var dateEmission : String
    var imgOrdonnance : String
    var renouvellement : Int
    var index : Int
    
    
}
