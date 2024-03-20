//
//  OrdoView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import SwiftUI

struct PickerRenouvellement: View {
    @State var nombreDerenouvellement: Int = 0
    
    var body: some View {
        
        Picker("Renouvellement:", selection: $nombreDerenouvellement) {
            ForEach(1..<4) {
                Text("\($0)/3")
            }
            
            
        }
        
        
        
    }
}

struct CopyOrdoView: View {
    @State var ordoModel = OrdonnanceModel()
    var body: some View {
        NavigationStack{
            NavigationView{
                List{
                    ForEach(ordoModel.filterOrdoValides()){ ordonnance in
                        NavigationLink(destination: Image("ordonnance")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 800)
                                       
                        )
                        {
                            VStack(alignment: .leading){
                                
                                Text("Ordonnance du \(ordonnance.dateEmission)")
                                    .font(.caption)
                                
                                
                            }
                            .padding(.trailing)
                            
                            
                            VStack(alignment: .leading){
                                PickerRenouvellement()
                                    .font(.caption)
                                
                            }
                            .padding(.leading)
                            
                            
                        }
                        .padding(.vertical)
                        .navigationTitle("Ordonnances en cours")
                        
                    } // ForEach
                } // List
            }
            .navigationTitle("Liste des ordonances")
            
            NavigationLink{
                
                OCRView()
            } label: {
                
                Text("Ajouter une ordonnance")
            }
            .padding()
            .foregroundStyle(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.accentColor)
            
          /*  Button(action: {
                ordoModel.addOrdonnance(dateEmisssion: .now, imgOrdonnance: "tori", renouvellement: 1)
            }, label: {
                Text("Ajouter un ordo manuellement")
            })
       Button(action: {
                ordoModel.DeleteOrdonnance(dateEmisssion: .now, imgOrdonnance: "tori", renouvellement: 0)
            }, label: {
                Text("Supprimer un ordo manuellement")
            }) */
            
        } // Nav stack
        .foregroundStyle(.black)
        
    }
    
}

#Preview {
    CopyOrdoView()
}
