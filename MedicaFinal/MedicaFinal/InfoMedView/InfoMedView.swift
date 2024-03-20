import SwiftUI

struct InfoMedView: View {
    var listMed: TabMedicament = TabMedicament()
    var tabMed: TabRappelMed = TabRappelMed()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List(tabA) { obj in
                NavigationLink {
                    DetailMedView(med: obj)
                } label: {
                    Text(obj.name)
                }
            }
            .navigationTitle("Médicaments")
        }
        .searchable(text: $searchText, prompt: "rechercher médicament")
    }
    var tabA: [Medicament] {
        if searchText.isEmpty {
            return listMed.med
        } else {
            return listMed.med.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    InfoMedView(listMed: TabMedicament(), tabMed: TabRappelMed())
}
