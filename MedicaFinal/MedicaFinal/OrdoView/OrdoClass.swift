//
//  OrdoClass.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 08/03/2024.
//

import Foundation



class OrdonnanceModel : ObservableObject {
    
    
    @Published var ordonnances : [Ordonnance] = []
    
   
    
    func addOrdonnance(dateEmisssion : Date, imgOrdonnance : String, renouvellement : Int) {
           self.ordonnances.append(Ordonnance(dateEmission: Date().formatted(date: .numeric, time: .omitted), imgOrdonnance: "ordo1", renouvellement: 1))
       }
    
    func DeleteOrdonnance(dateEmisssion : Date, imgOrdonnance : String, renouvellement : Int) {
        self.ordonnances.remove(at:  1)
       }
}
