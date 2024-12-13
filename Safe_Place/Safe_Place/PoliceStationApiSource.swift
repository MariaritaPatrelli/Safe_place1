//
//  Untitled.swift
//  Safe_Place
//
//  Created by Mariarita Patrelli on 09/12/24.
//

import Foundation
import Combine
import MapKit

struct PoliceStation: Identifiable, Decodable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

class PoliceStationApiSource: ObservableObject {
    private let apiKey = "I63802885C8189B2B,I7C250D2CDCB364A"
    private let baseURL = "https://maps-api.apple.com/v1/place"
    
    @Published var policeStations: [PoliceStation] = [] // Pubblica lista per aggiornare la UI
    @Published var isLoading: Bool = false // Stato di caricamento
    
    func fetchPoliceStations() {
        guard let url = URL(string: "\(baseURL)?ids=\(apiKey)&lang=en") else {
            print("URL non valido")
            return
        }
        
        isLoading = true // Inizia il caricamento
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            defer {
                DispatchQueue.main.async {
                    self?.isLoading = false // Fine caricamento
                }
            }
            
            if let error = error {
                print("Errore nella richiesta: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Dati non ricevuti")
                return
            }
            
            do {
                // Decodifica la risposta in un array di stazioni di polizia
                let stations = try JSONDecoder().decode([PoliceStation].self, from: data)
                let filteredStations = stations.filter { station in
                                   let lowercasedName = station.name.lowercased()
                                   return lowercasedName.contains("police station") || lowercasedName.contains("police")
                               }
                               
                               DispatchQueue.main.async {
                                   self?.policeStations = filteredStations // Aggiorna la lista delle stazioni
                               }
                           } catch {
                               print("Errore nella decodifica: \(error.localizedDescription)")
                           }
                       }.resume()
                   }
    }


