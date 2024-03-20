import SwiftUI

//struct InfoMedView: View {
//    @ObservedObject var listMed: TabMedicament
//    @ObservedObject var tabMed: TabRappelMed
//    @State var searchText = ""
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack {
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 300))], content: {
//                        ForEach(tabA) { tab in
//                            NavigationLink {
//                                ChildView(profil: tab)
//                            } label: {
//                                ParentView(prof: tab)
//                            }
//                        }
//                    })
//                }
//                .navigationTitle("Info Medicament")
//            }
//            .searchable(text: $searchText, prompt: "rechercher médicament")
//        }
//    }
//    var tabA: [Medicament] {
//        if searchText.isEmpty {
//            return listMed.med
//        } else {
//            return listMed.med.filter {
//                $0.name.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//}
//#Preview {
//    InfoMedView()
//}
