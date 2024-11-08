//
//  ImageExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 8/11/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("totodile")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 100)
        
        
        Image("totodile")
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 100)
        
        Image(systemName: "figure.walk")
            .resizable()
            .frame(width: 80, height: 100)
        
    }
}

#Preview {
    ImageExample()
}
