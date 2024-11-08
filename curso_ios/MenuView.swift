//
//  MenuView.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 9/11/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
                
                NavigationLink(destination: SuperheroFinder()) {
                    Text("Superhero Finder")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
