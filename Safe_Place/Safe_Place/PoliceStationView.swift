//
//  PoliceStationView.swift
//  Safe_Place
//
//  Created by Mariarita Patrelli on 10/12/24.
//

//import SwiftUI
//import MapKit
//struct PoliceStationView: View {
//    
//    @State private var position: MapCameraPosition =
//        .automatic
//    @State private var policestations: [MKMapItem] = []
//    @State private var selection: MapSelection<MKMapItem>?
//    
//    var body: some View {
//        Map (position: $position, selection: $selection) {
//            ForEach(policestations, id: \.self) {police in
//                Marker(item: police)
//                    .tag(MapSelection(police))
//            }
//            .mapItemDetailSelectionAccessory(.callout)
//        }
//        
//        .task {
//            guard let naples = await findCity() else {
//                return
//            }
//            policestations = await findPoliceStations( in: naples)
//        }
//        .mapFeatureSelectionAccessory(.callout)
//       
//    }
//    
//    
//}
//private func findCity() async -> MKMapItem? {
//let request = MKLocalSearch.Request()
//request.naturalLanguageQuery = "naples"
//request.addressFilter = MKAddressFilter(
//including: .locality)
//let search = MKLocalSearch (request: request)
//let response = try? await search.start ()
//return response?.mapItems.first
//}
//
//private func findPoliceStations( in city: MKMapItem
//                       ) async -> [MKMapItem] {
//let request = MKLocalSearch.Request ()
//request.naturalLanguageQuery = "police"
//let downtown = MKCoordinateRegion (
//center: city.placemark.coordinate,
//span: .init(
//latitudeDelta: 0.08,
//longitudeDelta: 0.08
//)
//)
//request.region = downtown
//request.regionPriority = .required
//let search = MKLocalSearch(request: request)
//let response = try? await search.start ()
//return response? .mapItems ?? []
//}
//struct PoliceStationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PoliceStationView()
//    }
//}
