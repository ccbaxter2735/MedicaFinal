//
//  ContentView.swift
//  MedicaFinal
//
//  Created by Apprenant69 on 16/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var nb: Int = 0
    var body: some View {
        if bool == false {
            splashScreenView(bool: $bool)
            
        } else {
            TabBar()
        }
        
    }
}

#Preview {
    ContentView()
    
}
