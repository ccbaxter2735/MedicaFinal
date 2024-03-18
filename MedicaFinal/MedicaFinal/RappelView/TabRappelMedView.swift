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
        HStack {
            Text(med.med.name)
            Stepper(value: $med.dosage, in: 0...10) {
                Text("dosage: \(med.dosage)")
            }
        }
        .padding()
    }
}

#Preview {
    TabRappelMedView(med: RappelMed(med: baseDonneesMed[0]))
}
