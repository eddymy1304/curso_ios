//
//  ButtonExample.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 8/11/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Button") {
            print("Pollito con papas")
        }

        Button(
            action: {
                print("Pollito y aguadito")
            },
            label: {
                Text("Guardar")
                    .frame(width: 100, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        )
    }
}

struct CounterButton: View {

    @State var subscribersNumber = 0

    var body: some View {
        Button(
            action: {
                subscribersNumber += 1
            },
            label: {
                Text("Subscribers: \(subscribersNumber)")
                    .bold()
                    .padding()
                    .frame(height: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        )
    }
}

#Preview {
    CounterButton()
}
