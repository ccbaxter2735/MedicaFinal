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
            VStack {
                Image(med.imgMed)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width - 10)
                Text(med.name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                Text(med.detailMed)
                    .font(.title3)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .background(.gray.opacity(0.0))
                HStack (alignment: .center){
                    Text("Type d'administration du médicament :")
                        .font(.body)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .background(.gray.opacity(0.0))
                    Spacer()
                    Text(med.typeAdmin.rawValue)
                        .font(.body)
                        .fontWeight(.thin)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .background(.gray.opacity(0.0))
                    Image(med.typeAdmin.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                }
                .padding(10)
            }
        }

    }
}

//#Preview {
//    DetailMedView()
//}
