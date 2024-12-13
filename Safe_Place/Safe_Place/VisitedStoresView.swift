//
//  VisitedStoresView.swift
//  Safe_Place
//
//  Created by Mariarita Patrelli on 10/12/24.
//
import SwiftUI
import MapKit

struct VisitedStoresView: View {
    
    
    var visitedStores: [MKMapItem]
    @State private var selection: MKMapItem?
    var body: some View {
        Map (selection: $selection) {
            ForEach(visitedStores, id: \.self) { store in
                Marker (item: store)
                    .mapItemDetailSelectionAccessory ()
            }
        }
    }
}

