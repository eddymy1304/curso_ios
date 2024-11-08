//
//  ContentView.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 8/11/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.orange)
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.yellow)
                    
            }
            
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.orange)
            
            HStack {
                Circle()
                    .foregroundColor(.green)
                
                Rectangle()
                
                Circle()
                    .foregroundColor(.purple)
            }
            .frame(height: 250)
            
            Rectangle()
                .frame(height: 100)
                .foregroundColor(.orange)
            
            HStack{
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.orange)
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.yellow)
                    
            }
        }
        .background(.red)
        .padding()
    }
}

#Preview {
    Exercise1()
}
