//
//  OrdoClass.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 08/03/2024.
//

import Foundation



class OrdonnanceModel : ObservableObject  {
    
    
    @Published var ordonnances : [Ordonnance] = ordoExemple
    
   
    
    
    
    func DeleteOrdonnance(dateEmisssion : Date, imgOrdonnance : String, renouvellement : Int) {
        self.ordonnances.remove(at:  0)
       }
    
}


var ordoExemple : [Ordonnance] = [

Ordonnance(dateEmission: "22-03-24", imgOrdonnance: "ordonnance", renouvellement: 1, index: 0),
Ordonnance(dateEmission: "10-10-23", imgOrdonnance: "ordonnance", renouvellement: 2, index: 1),
Ordonnance(dateEmission: "13-02-24", imgOrdonnance: "ordonnance", renouvellement: 3,  index: 2)


]
