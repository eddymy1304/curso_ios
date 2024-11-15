//
//  FavPlaces.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 14/11/24.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    
    @State var position = MapCameraPosition
        .region(
            MKCoordinateRegion(
                center:
                    CLLocationCoordinate2D(
                        latitude: -11.9760301,
                        longitude: -77.1489362
                    ),
                span:
                    MKCoordinateSpan(
                        latitudeDelta: 0.5,
                        longitudeDelta: 0.5
                    )
            )
        )
    
    @State var places: [Place] = []
    
    @State var showDialog: CLLocationCoordinate2D? = nil
    
    @State var name: String = ""
    
    @State var isFav: Bool = false
    
    @State var showSheet: Bool = false
    
    let heightSheet = stride(from: 0.3, through: 0.5, by: 0.1).map{ PresentationDetent.fraction($0)}
    
    var body: some View {
        
        ZStack {
            
            MapReader { proxy in
                
                Map(position: $position) {
                    ForEach(places) { place in
                        
                        let color: Color = if place.fav {.blue} else {.gray}
                        
                        Annotation(
                            place.name,
                            coordinate: place.coordinates
                        ) {
                            Circle()
                                .stroke(color, lineWidth: 4)
                                .fill(.white)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
                .onTapGesture { point in
                    if let coordinates = proxy.convert(point, from: .local) {
                        showDialog = CLLocationCoordinate2D(
                            latitude: coordinates.latitude,
                            longitude: coordinates.longitude
                        )
                    }
                }
                
            }
            .overlay{
                VStack {
                    
                    Button(action: {showSheet = true}) {
                        Text("Show list")
                            .foregroundColor(.blue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.blue, lineWidth: 2)
                                    .background(.white)
                            )
                            .border(.blue, width: 1)
                            .cornerRadius(8)
                        
                    }
                    Spacer()
                }
            }
            
            if showDialog != nil {
                
                let view = VStack {
                    
                    Text("Añadir localización")
                        .font(.title2)
                        .bold()
                    
                    TextField("Nombre", text: $name)
                    
                    Toggle("Favorito", isOn: $isFav)
                    
                    Button("Guardar") {
                        savePlace(isFav: isFav, name: name, coordinates: showDialog!)
                        cleanPlace()
                    }
                    
                }
                
                CustomDialog(
                    closeDialog: { cleanPlace() },
                    onDismissOutside: true,
                    content: view
                )
                
            }
            
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(places) { place in
                        
                        let color: Color = if place.fav{
                            .yellow.opacity(0.5)
                        } else {
                            .black.opacity(0.5)
                        }
                        
                        VStack {
                            Text(place.name)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.blue)
                        }
                        .frame(width: 150, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(color, lineWidth: 1)
                        }
                        .shadow(radius: 5)
                        .padding(.horizontal, 8)
                        .onTapGesture{
                            navToPlace(coordinates: place.coordinates)
                        }
                    }
                }
            }
            .presentationDetents(Set(heightSheet))
            
        }.onAppear{
            loadPlaces()
        }
        
        
    }
    
    func navToPlace(coordinates: CLLocationCoordinate2D) {
        withAnimation {
            position = getMapCameraPosition(lat: coordinates.latitude, lng: coordinates.longitude)
        }
    }
    
    func cleanPlace() {
        name = ""
        isFav = false
        showDialog = nil
    }
    
    func savePlace(isFav: Bool, name: String, coordinates: CLLocationCoordinate2D) {
        
        if name.isEmpty {return}
        
        let place = Place(name: name, coordinates: coordinates, fav: isFav)
        places.append(place)
        savePlaces()
    }
    
}

#Preview {
    FavPlaces()
}

extension FavPlaces {
    
    func savePlaces() {
        if let encodeData = try? JSONEncoder().encode(places) {
            print("savePlaces")
            UserDefaults.standard.set(encodeData, forKey: "favPlaces")
        }
    }
    
    func loadPlaces() {
        if let savedPlaces = UserDefaults.standard.data(forKey: "favPlaces"),
           let decodedPlaces = try? JSONDecoder().decode([Place].self, from: savedPlaces){
            print("loadPlaces")
            places = decodedPlaces
        }
    }
    
}
