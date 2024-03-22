//
//  OrdoView.swift
//  Medica
//
//  Created by Nayeff BOINARIZIKI on 11/03/2024.
//

import SwiftUI

struct detailOrdo: View {
    @ObservedObject var ordo: Ordonnance
    var tabColor: [Color] = [.green, .orange, .red]
    var body: some View {
        HStack (alignment: .center) {
            VStack(alignment: .leading){
                Text("Ordonnance du \(ordo.dateEmission)")
                    .font(.headline)
            }
            .padding(.trailing)
            VStack(alignment: .trailing){
                Text("Renouv. : \(ordo.renouvellement) / 3  ")
                    .font(.subheadline)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(tabColor[ordo.renouvellement - 1])
                if (ordo.renouvellement == 3) {
                    Text("Périmée    ")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.red)
                }
                Stepper("", value: $ordo.renouvellement, in: 1...3)
            }
            .padding(.trailing)
        }
    }
}

struct CopyOrdoView: View {
    @StateObject var ordoModel: OrdonnanceModel = OrdonnanceModel()
    
    func filterOrdoValides(ordoModel: OrdonnanceModel) -> [Ordonnance] {
        let newOrdo: OrdonnanceModel = OrdonnanceModel()
        newOrdo.ordonnances = ordoModel.ordonnances.filter{
            $0.renouvellement < 3
        }
        return newOrdo.ordonnances
    }
    
    func filterOrdoNonValides(ordoModel: OrdonnanceModel) -> [Ordonnance] {
        let newOrdo: OrdonnanceModel = OrdonnanceModel()
        newOrdo.ordonnances = ordoModel.ordonnances.filter{
            $0.renouvellement >= 3
        }
        return newOrdo.ordonnances
    }
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    ForEach(filterOrdoValides(ordoModel: ordoModel)){
                        ordonnance in
                        NavigationLink {
                            ScrollView {
                                Image(ordonnance.imgOrdonnance)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width - 10)
                            }
                        } label: {
                            detailOrdo(ordo: ordonnance)
                        }
                    }
                    .padding(.vertical)
                    .navigationTitle("Ordonnances")
                    .pickerStyle(.menu)
                } header: {
                    Text("Ordonnances valides")
                }
                Section {
                    ForEach(filterOrdoNonValides(ordoModel: ordoModel)){
                        ordonnance in
                        NavigationLink {
                            ScrollView {
                                Image(ordonnance.imgOrdonnance)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width - 10)
                            }
                        } label: {
                            detailOrdo(ordo: ordonnance)
                        }
                    }
                    .padding(.vertical)
                    .navigationTitle("Ordonnances")
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
                    .frame(width: 260, height: 11)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(8)

                    
            }
            .padding([.leading, .bottom, .trailing], 20)
        }
    }
}

#Preview {
    CopyOrdoView(ordoModel: OrdonnanceModel())
}
