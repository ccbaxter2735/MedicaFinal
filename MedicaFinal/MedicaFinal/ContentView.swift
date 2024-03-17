//
//  ContentView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    // pour l'instant j'ai mis la TabBar directement à la racine de l'application mais si vous voulez faire autrement je peux la modifier
    var body: some View {
        TabView {
            RappelTestView()
                .tabItem {
                    Label(
                        title: { Text("Rappel") },
                        icon: { Image(systemName: "bell")}
                            
                    )
                   
                }
                
                
                
            Calview()
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
            ProfilView()
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
    ContentView()
    
}
