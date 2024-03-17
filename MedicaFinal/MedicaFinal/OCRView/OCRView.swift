//
//  OCRView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 12/03/2024.
//

import SwiftUI

struct OCRView: View {
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    @ObservedObject var ordoModel = OrdonnanceModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts){text in
                            NavigationLink(
                                destination:ScrollView{Text(text.content)},
                                label: {
                                    Text(text.content).lineLimit(1)
                                })
                        }
                    }
                }
                else{
                    Text("No scan yet").font(.title)
                }
            }
            .navigationTitle("Scan OCR")
            .navigationBarItems(trailing: Button(action: {
                self.showScannerSheet = true
                
                ordoModel.addOrdonnance(dateEmisssion: .now, imgOrdonnance: "tori", renouvellement: 0)
                
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
            })
                .sheet(isPresented: $showScannerSheet, content: {
                    
                    Button(action: {
                        ordoModel.addOrdonnance(dateEmisssion: .now, imgOrdonnance: "tori", renouvellement: 0)
                        }, label: {
                        
                        Text("Ajouter ?")
                        
                        
                    })
                    
                    
                    
                    Image("ordonnance")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 900)
                    
                    
                })
            )
        }
    }
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

#Preview {
    OCRView()
}
