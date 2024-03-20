//
//  TabRappelMedView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 18/03/2024.
//

import SwiftUI

struct TabRappelMedView: View {
    @ObservedObject var med: RappelMed
    
    var body: some View {
        HStack (alignment: .center){
            Text(med.med.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .background(.gray.opacity(0.0))
//            Spacer()
            Stepper("Quantité: \(med.dosage)", value: $med.dosage, in: 0...10)
                .padding(10)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .background(.gray.opacity(0.0))
        }

    }
}

#Preview {
    TabRappelMedView(med: RappelMed(med: baseDonneesMed[0]))
}
