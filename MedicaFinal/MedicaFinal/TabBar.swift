//
//  TabBar.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 18/03/2024.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            RappelView()
                .tabItem {
                    Label(
                        title: { Text("Rappel") },
                        icon: { Image(systemName: "bell")}
                    )
                }
            CalView()
                .tabItem {
                    Label(
                        title: { Text("Calendrier") },
                        icon: { Image(systemName: "calendar")}
                    )
                }
           CopyOrdoView()
                .tabItem {
                    Label(
                        title: { Text("Ordonnance") },
                        icon: { Image(systemName: "doc")}
                    )
                }
            InfoMedView()
                .tabItem {
                    Label(
                        title: { Text("info") },
                        icon: { Image(systemName: "info")}
                    )
                }
        }
    }
}

#Preview {
    TabBar()
}