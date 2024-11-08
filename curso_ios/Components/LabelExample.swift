//
//  LabelExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 8/11/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        // Texto e imagen juntas
        
        //Esto no se puede editar
        //Label("Totodile", image: "figure.walk")
        
        Label("Walking", systemImage: "figure.walk")
        
        Label(
            title: {
                Text("Totodile")
            },
            icon: {
                Image("totodile")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
            }
        )
    }
}

#Preview {
    LabelExample()
}
