//
//  ContentView.swift
//  Safe_Place
//
//  Created by Mariarita Patrelli on 07/12/24.
import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showModal = false
    

    var body: some View {
        ZStack {
            // PoliceStationView come sfondo
            PoliceStationView()
                .edgesIgnoringSafeArea(.all)

            // Modale in primo piano
            if showModal {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all) // Sfondo semi-trasparente
                    .onTapGesture {
                        // Chiudi la modale se tocchi lo sfondo
                        showModal = false
                    }

                VStack(spacing: 20) {
                    Text("Modale con Titolo")
                        .font(.title)
                        .bold()
                        .padding()
                        .background(Color.white)
                        
                }
                
                .padding()
            }
        }
       
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
