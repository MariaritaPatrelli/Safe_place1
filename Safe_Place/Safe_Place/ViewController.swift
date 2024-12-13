//
//  Untitled.swift
//  Safe_Place
//
//  Created by Mariarita Patrelli on 09/12/24.
//
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // Crea una variabile per la mappa
    var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Inizializza la mappa
        mapView = MKMapView(frame: self.view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Aggiungi la mappa alla vista principale
        self.view.addSubview(mapView)
        
        // Centra la mappa su una posizione specifica
        let initialLocation = CLLocation(latitude: 41.9028, longitude: 12.4964) // Roma
        centerMapOnLocation(location: initialLocation)
    }
    
    // Funzione per centrare la mappa su una posizione
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 10000 // Distanza in metri
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

