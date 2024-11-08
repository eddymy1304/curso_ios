//
//  IMCResult.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 10/11/24.
//

import SwiftUI

struct IMCResult: View {
    
    let height: Double
    let weight: Double
    
    var body: some View {
        
        let result = calculateIMC(height: height, weight: weight)
        
        VStack {
            
            Text("Your result is:")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            
            InformationView(result: result)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateIMC(height: Double, weight: Double) -> Double {
    return weight / (pow((height / 100), 2))
}

func getIMCResult(result: Double) ->(String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
    switch result {
    case 0.00...18.50:
        title = "Underweight"
        description = "You are underweight. "
        color = .yellow
        
        case 18.51...24.99:
        title = "Normal"
        description = "You are normal."
        color = .green
        
    case 25.00...29.99:
        title = "Overweight"
        description = "You are overweight."
        color = .orange
        
    case 30.00...100.00:
        title = "Obese"
        description = "You are obese."
        color = .red
        
    default:
        title = "Error"
        description = "Something went wrong."
        color = .gray
        
    }
    
    return (title, description, color)
}

struct InformationView: View {
    
    let result: Double
    
    var body: some View {
        
        let information = getIMCResult(result: result)
        
        VStack{
            Text(information.0)
                .foregroundColor(information.2)
                .font(.title)
                .bold()
                .padding(.top, 16)
            
            Text("\(result, specifier: "%.2f")")
                .foregroundColor(.white)
                .font(.system(size: 80))
                .bold()
            
            Text(information.1)
                .foregroundColor(.white)
                .font(.title2)
                .padding(.horizontal, 16)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity )
        .background(.backgroundComponent)
        .cornerRadius(16)
        .padding(.horizontal, 16)
    }
}

#Preview {
    IMCResult(height: 163, weight: 110)
}
