//
//  OrdoView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import SwiftUI

struct PickerRenouvellement: View {
    @Binding var nombreDerenouvellement : Int
    
    var body: some View {
        
        Picker("Renouvellement:", selection: $nombreDerenouvellement) {
            ForEach(1..<4) {
                Text("\($0)/3")
            }
            
            
        }
        
        
        
    }
}

struct CopyOrdoView: View {
    @State var nombreDerenouvellement: [Int] = Array(repeating: 0, count: 3)
    
    
    
    
    var i: Int = 0
    @State var ordoModel = OrdonnanceModel()
    var body: some View {
        NavigationStack{
            List {
                Section {
                    ForEach(ordoModel.filterOrdoValides()){
                        ordonnance in
                        HStack{
                            VStack(alignment: .leading){
                                
                                Text("Ordonnance du \(ordonnance.dateEmission)")
                                    .font(.caption)
                                
                                
                            }
                            .padding(.trailing)
                            
                            
                            VStack(alignment: .leading){
                                PickerRenouvellement(nombreDerenouvellement: $nombreDerenouvellement[ordonnance.index])
                                
                                
                                    .font(.caption)
                                
                            }
                            .padding(.leading)
                        }
                        
                        
                        
                        
                    }
                    .padding(.vertical)
                    .navigationTitle("Liste des ordonnances")
                    .pickerStyle(.menu)
                    
                    
                } header: {
                    Text("Ordonnances valides")
                }
                
                Section {
                    ForEach(ordoModel.filterOrdoNonValides()){ ordonnance in
                        HStack{
                            VStack(alignment: .leading){
                                
                                Text("Ordonnance du \(ordonnance.dateEmission)")
                                    .font(.caption)
                                
                                
                            }
                            .padding(.trailing)
                            
                            
                            VStack(alignment: .leading){
                                PickerRenouvellement(nombreDerenouvellement: $nombreDerenouvellement[ordonnance.index])
                                
                                
                                    .font(.caption)
                                
                            }
                            .padding(.leading)
                        }
                        
                    }
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
    CopyOrdoView()
}

