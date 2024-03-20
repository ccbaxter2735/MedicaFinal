//
//  OrdoView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import SwiftUI

struct detailOrdo: View {
    @ObservedObject var ordo: Ordonnance
    var body: some View {
        HStack (alignment: .center) {
            VStack(alignment: .leading){
                
                Text("Ordonnance du \(ordo.dateEmission)")
                    .font(.headline)
            }
            .padding(.trailing)
            VStack(alignment: .trailing){
                Text("Renouvellement : \(ordo.renouvellement)/3")
                    .font(.subheadline)
                Stepper("", value: $ordo.renouvellement, in: 0...4)
            }
            .padding(.leading)
        }
    }
}

struct CopyOrdoView: View {
    var ordoModel: OrdonnanceModel = OrdonnanceModel()
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    ForEach(ordoModel.filterOrdoValides()){
                        ordonnance in
                        detailOrdo(ordo: ordonnance)
                    }
                    .padding(.vertical)
                    .navigationTitle("Ordonnances")
                    .pickerStyle(.menu)
                    
                } header: {
                    Text("Ordonnances valides")
                }
                
                Section {
                    ForEach(ordoModel.filterOrdoNonValides()){
                        ordonnance in
                        detailOrdo(ordo: ordonnance)
                    }
                    .padding(.vertical)
                    .navigationTitle("Ordonnances en cours")
                    .pickerStyle(.menu)
                    
                } header: {
                    Text("Ordonnances non valides")
                }
            }
            .foregroundStyle(.black)
            NavigationLink{
                
                OCRView()
            } label: {
                
                Text("Ajouter une ordonnance")
            }
            .padding()
            .foregroundStyle(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.accentColor)
        }
    }
}

#Preview {
    CopyOrdoView(ordoModel: OrdonnanceModel())
}

