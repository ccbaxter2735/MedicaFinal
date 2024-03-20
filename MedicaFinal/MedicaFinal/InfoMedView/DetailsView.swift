//
//  DetailsView.swift
//  Medica
//
//  Created by Apprenant68 on 13/03/2024.
//

import SwiftUI

struct DetailMedView: View {
    var med: Medicament
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Image(med.imgMed)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 10)
                Text(med.name)
                    .font(.title)
                    .padding(.horizontal, 20)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                Text(med.detailMed)
                    .font(.title3)
                    .padding(.horizontal, 20)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                VStack (alignment: .leading){
                    Text("Type d'administration du médicament :")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .background(.gray.opacity(0.0))
                    Spacer()
                    HStack {
                        Text(med.typeAdmin.rawValue)
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .background(.gray.opacity(0.0))
                        Image(med.typeAdmin.rawValue)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
            }
            
        }
        
    }
}

//#Preview {
//    DetailMedView()
//}
