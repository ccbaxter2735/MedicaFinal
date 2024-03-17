import SwiftUI

struct InfoMedView: View {
    @State private var recherche = ""
    @State private var enRecherche = false
    
    var body: some View {
        NavigationView {
            VStack {
                Barre(recherche: $recherche, enRecherche: $enRecherche)
                
                List {
                    ForEach(filteredNames, id: \.self) { name in
                        Text(name)
                    }
                }
                .navigationTitle("Médicaments")
            }
        }
    }
    
    private var nom = ["Dafalgan", "Diprozone", "Gabitril", "Paracétamol", "Smecta", "Spasfon Lyoc"]
    
    private var filteredNames: [String] {
        if recherche.isEmpty {
            return nom
        } else {
            return nom.filter { $0.localizedCaseInsensitiveContains(recherche) }
        }
    }
}

struct Barre: View {
    @Binding var recherche: String
    @Binding var enRecherche: Bool
    
    var body: some View {
        HStack {
            TextField("Rechercher ...", text: $recherche)
                .padding(.leading, 24)
                .padding(.vertical, 12)
                .padding(.trailing, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onTapGesture {
                    enRecherche = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 18)
                            .padding(.trailing, enRecherche ? 0 : 8)
                        
                        if enRecherche {
                            Button(action: {
                                recherche = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 19)
                            }
                        }
                    }
                )
            
            if enRecherche {
                Button(action: {
                    enRecherche = false
                    recherche = ""
                }) {
                    Text("Annuler")
                        .foregroundColor(.green)
                }
                .padding(.trailing)
                .transition(.move(edge: .trailing))
//                withAnimation(.default)
            }
        }
//        .animation(.default)
    }
}
#Preview {
    InfoMedView()
}

