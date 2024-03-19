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
        HStack (alignment: .center, spacing: 30){
            Text(med.med.name)
            Stepper("Dosage: \(med.dosage)", value: $med.dosage, in: 0...10)
        }
        .padding(2)
    }
}

#Preview {
    TabRappelMedView(med: RappelMed(med: baseDonneesMed[0]))
}
