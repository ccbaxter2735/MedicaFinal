//
//  DetailsView.swift
//  Medica
//
//  Created by Apprenant68 on 13/03/2024.
//

import SwiftUI

struct DetailsView: View {
//    class Medicament{
//        var titre: String
//        var frequence: String
//        var info: String
//        var danger: String
//
//        init(titre: String, frequence: String, info: String, danger: String){
//            self.titre = titre
//            self.frequence = frequence
//            self.info = info
//            self.danger = danger
//        }
//        func describe() -> String{
//            return
//        }
//    }
    var nom : String
    var body: some View {
        
        Text("Détails de \(nom)")
            .navigationBarTitle(nom)
    }
}

#Preview {
    DetailsView(nom: "Doliprane")
}
