//
//  OrdoClass.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 08/03/2024.
//

import Foundation



class OrdonnanceModel : ObservableObject  {
    
    
    @Published var ordonnances : [Ordonnance] = ordoExemple
    
   
    
    func addOrdonnance(dateEmisssion : Date, imgOrdonnance : String, renouvellement : Int) {
           self.ordonnances.append(Ordonnance(dateEmission: Date().formatted(date: .numeric, time: .omitted), imgOrdonnance: "ordo1", renouvellement: 1))
       }
    
    func DeleteOrdonnance(dateEmisssion : Date, imgOrdonnance : String, renouvellement : Int) {
        self.ordonnances.remove(at:  0)
       }
    
    func filterOrdoValides() -> [Ordonnance] {
        self.ordonnances = self.ordonnances.filter{
            $0.renouvellement < 3
        }
        return self.ordonnances
    }
    
    func filterOrdoNonValides() ->[Ordonnance] {
        self.ordonnances = self.ordonnances.filter{
            $0.renouvellement >= 3
        }
        return self.ordonnances
    }
    
}


var ordoExemple : [Ordonnance] = [

Ordonnance(dateEmission: "19-11-22", imgOrdonnance: "ordonnance", renouvellement: 1),
Ordonnance(dateEmission: "12-09-23", imgOrdonnance: "ordonnance", renouvellement: 2),
Ordonnance(dateEmission: "13-05-23", imgOrdonnance: "ordonnance", renouvellement: 3)


]
