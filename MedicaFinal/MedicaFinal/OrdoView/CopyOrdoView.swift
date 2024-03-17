//
//  OrdoView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import SwiftUI

struct CopyOrdoView: View {
    @ObservedObject var ordoModel = OrdonnanceModel()
    @State var OCR = OCRView()
    @State var test = ""
    
    var body: some View {
        
        
        
        NavigationStack{
            
            
            
            
            NavigationView{
                List{
                    ForEach(ordoModel.ordonnances){ ordonnance in
                        
                        HStack(spacing: 100){
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
                                
                                
                                
                                VStack(alignment: .trailing){
                                    Text("Renouvellement \(ordonnance.renouvellement)/3")
                                        .font(.caption)
                                    
                                }
                            }
                            
                        }
                        .navigationTitle("Ordonnances en cours")
                        .padding()
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
            .foregroundStyle(.mint)
            
            Button(action: {
                ordoModel.addOrdonnance(dateEmisssion: .now, imgOrdonnance: "tori", renouvellement: 1)
            }, label: {
                Text("Ajouter un ordo manuellement")
            })
            Button(action: {
                ordoModel.DeleteOrdonnance(dateEmisssion: .now, imgOrdonnance: "tori", renouvellement: 0)
            }, label: {
                Text("Supprimer un ordo manuellement")
            })
        } // Nav stack
        .foregroundStyle(.black)
        
    }
    
}





#Preview {
    CopyOrdoView()
}
