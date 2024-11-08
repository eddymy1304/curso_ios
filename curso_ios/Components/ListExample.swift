//
//  ListExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 11/11/24.
//

import SwiftUI

let pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Squirtle"),
    Pokemon(name: "Bulbasaur")
]

let digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Gabumon"),
    Digimon(name: "Piyomon"),
    Digimon(name: "Palmon")
]

struct ListExample: View {
    var body: some View {
        // Lista basica ejemplo
        List {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
        
        // Lista con foreach
        List {
            ForEach(pokemons, id: \.name) { pokemon in
                /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
            }
        }
        
        // Lista identifiable
        List(digimons) { digimon in
            Text(digimon.name)
        }
        
        // Lista con secciones
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            
            Section(header: Text("Digimons")) {
                ForEach(digimons) {digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.grouped)
        
    }
}

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id : UUID = UUID()
    let name: String
}

#Preview {
    ListExample()
}
