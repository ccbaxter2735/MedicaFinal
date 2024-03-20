//
//  OrdoView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import SwiftUI

struct OrdoView: View {
    @ObservedObject var ordoModel = OrdonnanceModel()
    @State var OCR = OCRView()
    @State var test = ""
    
    var body: some View {
        NavigationStack{
            
            VStack {
                List{
                    ScrollView{
                        
                        
                        ForEach(ordoModel.ordonnances){ ordonnance in
                            
                            HStack(spacing: 30){
                                VStack(alignment: .leading){
                                    Text("Ordonnance en cours")
                                        .bold()
                                    Text("Ordonnance du \(ordonnance.dateEmission)")
                                        .font(.caption)
                                }
                                
                                VStack(alignment: .trailing){
                                    Text("Renouvellement \(ordonnance.renouvellement)/3")
                                        .font(.caption)
                                }
                                .padding(.top)
                            }
                            
                            
                            
                        }
                        .frame(height: 60)
                        .foregroundStyle(.black)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.bar))
                        .padding()
                        
                        
                        
                        
                        NavigationLink{
                            
                            OCRView()
                        } label: {
                            
                            Text("Ajouter une ordonnance")
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.mint)
                        
                        
                        
                        
                    }
                }
                .navigationTitle("Liste des ordonnances")
            }
            
            
        }
        
    }
    
    
}


#Preview {
    OrdoView()
}
