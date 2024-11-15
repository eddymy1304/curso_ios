//
//  CustomDialog.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 14/11/24.
//

import SwiftUI

struct CustomDialog<V:View>: View {
    
    // onDismiss
    let closeDialog: () -> Void
    
    // cancelable
    let onDismissOutside: Bool
    
    let content: V
    
    
    var body: some View {
        ZStack{
            // Parte opaca de un dialog
            Rectangle()
                .fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDismissOutside {
                        withAnimation{
                            closeDialog()
                        }
                    }
                }
            
            content
                .frame(
                    width: UIScreen.main.bounds.width - 100,
                    height: 300
                )
                .padding()
                .background(.white)
                .cornerRadius(16)
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        withAnimation{
                            closeDialog()
                        }
                    }
                    ){
                        Image(systemName: "xmark.circle")
                    }
                    .padding()
                }
        }
        .ignoresSafeArea()
        .frame(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height,
            alignment: .center
        )
    }
}

#Preview {
    CustomDialog(
        closeDialog: {}, onDismissOutside: true, content: VStack {
            Text("Title")
            Text("Message")
        }
    )
}
