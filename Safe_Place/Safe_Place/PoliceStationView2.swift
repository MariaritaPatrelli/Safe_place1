//
//  Police.swift
//  Safe_Place
//
//  Created by Mariarita Patrelli on 11/12/24.
//
//import SwiftUI
//import MapKit
//
//struct PoliceStationView2: View {
//    @State private var position: MapCameraPosition = .automatic
//    @State private var policestations: [MKMapItem] = []
//    @State private var searchQuery: String = ""
//    @State private var selection: MapSelection<MKMapItem>?
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            // Mappa
//            Map(position: $position, selection: $selection) {
//                ForEach(policestations, id: \.self) { police in
//                    Marker(item: police)
//                }
//                .mapItemDetailSelectionAccessory(.callout)
//            }
//            .task {
//                guard let naples = await findCity() else { return }
//                policestations = await findPoliceStations(in: naples)
//            }
//            .mapFeatureSelectionAccessory(.callout)
//            
//            // Modale sempre visibile
//            BottomSheet {
//                ModalView(searchQuery: $searchQuery)
//            }
//            .frame(maxHeight: UIScreen.main.bounds.height * 0.4) // Limita l'altezza della modale
//        }
//        .edgesIgnoringSafeArea(.all) // Per estendere la mappa sotto la modale
//    }
//}
//
//// BottomSheet personalizzato
//struct BottomSheet<Content: View>: View {
//    let content: Content
//
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Capsule()
//                .fill(Color.gray)
//                .frame(width: 40, height: 6)
//                .padding(.top, 8)
//            
//            content
//                .background(Color.white)
//                .cornerRadius(16)
//                .shadow(radius: 10)
//        }
//        .background(Color.white.opacity(0.8))
//    }
//}
//
//// ModalView con titolo e barra di ricerca
//struct ModalView: View {
//    @Binding var searchQuery: String
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("Cerca Stazioni di Polizia")
//                .font(.title2)
//                .padding(.horizontal)
//            
//            TextField("Cerca...", text: $searchQuery)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal)
//            
//            Spacer() // Per lasciare spazio sotto
//        }
//        .padding(.top)
//    }
//}
//
//private func findCity() async -> MKMapItem? {
//    let request = MKLocalSearch.Request()
//    request.naturalLanguageQuery = "naples"
//    request.addressFilter = MKAddressFilter(including: .locality)
//    let search = MKLocalSearch(request: request)
//    let response = try? await search.start()
//    return response?.mapItems.first
//}
//
//private func findPoliceStations(in city: MKMapItem) async -> [MKMapItem] {
//    let request = MKLocalSearch.Request()
//    request.naturalLanguageQuery = "police"
//    let downtown = MKCoordinateRegion(
//        center: city.placemark.coordinate,
//        span: .init(latitudeDelta: 0.08, longitudeDelta: 0.08)
//    )
//    request.region = downtown
//    request.regionPriority = .required
//    let search = MKLocalSearch(request: request)
//    let response = try? await search.start()
//    return response?.mapItems ?? []
//}
//
//struct PoliceStationView2_Previews: PreviewProvider {
//    static var previews: some View {
//        PoliceStationView2()
//    }
//}
//
