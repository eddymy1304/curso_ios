//
//  MapsExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 13/11/24.
//

import SwiftUI
import MapKit

struct MapsExample: View {
    
    @State var position = getMapCameraPosition(lat: -5.090205, lng: -81.1094215)
    
    var body: some View {
        ZStack {
            MapReader { proxy in
                
                Map(position: $position) {
                    // Marker por defecto
                    /*Marker(
                        "Eddycito",
                        coordinate: CLLocationCoordinate2D(
                            latitude: -5.090205,
                            longitude: -81.1094215
                        )
                    )*/
                    
                    //Marker custom
                    Annotation(
                        "Eddycito",
                        coordinate: CLLocationCoordinate2D(
                            latitude: -5.090205,
                            longitude: -81.1094215
                        )
                    ) {
                        Image(.totodile)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 100)
                    }
                    .annotationTitles(.hidden)
                }
                .mapStyle(
                    .hybrid(
                        elevation: .realistic,
                        showsTraffic: false
                    )
                )
                .onMapCameraChange/*(frequency: .continuous)*/ { context in
                    print("estamos en: \(context.region)")
                }
                .onTapGesture { p in
                    if let coordinates = proxy.convert(p, from: .local) {
                        print(coordinates)
                        withAnimation {
                            position = getMapCameraPosition(
                                lat: coordinates.latitude,
                                lng: coordinates.longitude
                            )
                        }
                    }
                }
                
            }
            
            
            VStack {
                Spacer()
                HStack {
                    Button("Ir al sur") {
                        withAnimation {
                            position = getMapCameraPosition(
                                lat: -5.1023493,
                                lng: -81.1128603
                            )
                        }
                    }
                    .padding(16)
                    .background(.white)
                    .padding()
                    
                    Button("Ir al norte") {
                        withAnimation {
                            position = getMapCameraPosition(
                                lat: -5.0918987,
                                lng: -81.0963548
                            )
                        }
                        
                    }
                    .padding(16)
                    .background(.white)
                    .padding()
                }
            }
        }
    }
    
}

func getMapCameraPosition(
    lat: Double,
    lng: Double,
    latD: Double = 0.1,
    lngD: Double = 0.1
) -> MapCameraPosition {
    return MapCameraPosition
        .region(
            MKCoordinateRegion(
                center:
                    CLLocationCoordinate2D(
                        latitude: lat,
                        longitude: lng
                    ),
                span: MKCoordinateSpan(latitudeDelta: latD, longitudeDelta: lngD)
            )
        )
}

#Preview {
    MapsExample()
}
