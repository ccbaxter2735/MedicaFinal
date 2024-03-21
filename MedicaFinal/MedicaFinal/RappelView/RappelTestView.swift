//
//  RappelView.swift
//  Medica
//
//  Created by Thomas on 07/03/2024.
//

import SwiftUI

// MARK: vue global de rappel
struct RappelTestView: View {
    @ObservedObject var tabRappel: TabRappel
    // filtre si le rappel est bien today
    var tabR: [Rappel] = rappelTest.filter {
        isDay(tabInt: $0.weekday) == true
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray
                    .edgesIgnoringSafeArea(.bottom) // color fond a revoir
                VStack {
                    ScrollView {
                        ForEach(tabR) { tab in
                            CheckView(rapp: tab, tabRappel: tabRappel)
                        }
                        
                    }
                    .navigationTitle("Rappel")
                    .padding(10)
                }
            }
        }
    }
}

//#Preview {
////    RappelTestView()
//}

// MARK: view de chaque rappel dans la RappelView
struct CheckView: View {
    // ------------- var checkView -----------------
    
    @ObservedObject var rapp: Rappel
    @ObservedObject var tabRappel: TabRappel
    
    // ------------- body checkView ----------------
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width - 20, height: (80 + CGFloat(rapp.tabMed.count * 50))) // bonne adapt taille rectangle et nb élément -> !!! a changer voir video weather
                .foregroundColor(.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            VStack {
//                RappTitleView(rapp: rapp, tabRappel: tabRappel)
                //                List {
                //                    Section {
                //                        DisclosureGroup("titre de disclosure") {
                VStack (alignment: .leading) {
                    ForEach (rapp.tabMed) { tab in
//                        MedView(rapp: rapp, tabM: tab, tabRappel: TabRappel())
                    }
                }
            }
        }
    }
}
