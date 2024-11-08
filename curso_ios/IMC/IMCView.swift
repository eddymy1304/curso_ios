//
//  IMCView.swift
//  curso_ios
//
//  Created by Eddy Mendoza on 9/11/24.
//

import SwiftUI

struct IMCView: View {
    
    /*    init() {
     UINavigationBar
     .appearance()
     .titleTextAttributes = [.foregroundColor: UIColor.white]
     }
     */
    
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 20
    @State var weight: Int = 50
    
    var body: some View {
        //El orden de los modificadores siempre importa
        VStack {
            
            HStack {
                ToggleButton(text: "Male", imageName: "figure.stand", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Female", imageName: "figure.stand.dress", gender: 1, selectedGender: $gender)
            }
            
            HeightCalculator(selectedHeight: $height)
            
            HStack {
                CounterViewButton(text: "Age", value: $age)
                CounterViewButton(text: "Weight", value: $weight)
            }
            
            IMCCalculateButton(height: height, weight: Double(weight))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundApp)
        .toolbar {
            
            ToolbarItem(placement: .principal){
                Text("IMC Calculator")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            
        }
        //        .navigationBarBackButtonHidden()
        //        .navigationTitle("IMC Calculator")
    }
}

struct IMCCalculateButton: View {
    
    let height: Double
    let weight: Double
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {IMCResult(height: height, weight: weight)}) {
                Text("Calculate")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

struct CounterViewButton: View {
    
    let text: String
    @Binding var value: Int
    
    var body: some View {
        VStack {
            TitleText(text: text)
            TextInformation(text: "\(value)")
            HStack {
                CircleButton(isPlus: false, value: $value)
                
                CircleButton(isPlus: true, value: $value)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(16)
    }
}

struct CircleButton: View {
    
    let isPlus: Bool
    @Binding var value: Int
    
    var body: some View {
        
        let nameImage = if(isPlus){
            "plus"
        } else {
            "minus"
        }
        
        Button(action: {
            if(isPlus){
                if(value >= 100) { return }
                value += 1
            } else {
                if(value <= 0) { return }
                value -= 1
            } }) {
                ZStack {
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.purple)
                    Image(systemName: nameImage)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                }
            }
    }
}

struct ToggleButton: View {
    
    let text: String
    let imageName: String
    let gender: Int
    
    @Binding var selectedGender: Int
    
    var body: some View {
        
        let color = getColor()
        
        Button(action: { selectedGender = gender }) {
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                TextInformation(text: text)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
    
        .cornerRadius(16)
    }
    
    func getColor() -> Color {
        return if(gender == selectedGender) {
            Color(.backgroundComponentSelected)
        } else {
            Color(.backgroundComponent)
        }
    }
}

struct TextInformation: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}

struct HeightCalculator: View {
    
    @Binding var selectedHeight: Double
    
    private let range: ClosedRange<Double> = 100...220
    
    private let valueStep: Double = 1
    
    
    var body: some View {
        VStack {
            TitleText(text: "Height")
            TextInformation(text: "\(Int(selectedHeight)) cm")
            Slider(
                value: $selectedHeight,
                in: range,
                step: valueStep
            )
            .accentColor(.purple)
            .padding(.horizontal,16)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(16)
        
    }
}

struct TitleText: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .foregroundColor(.gray)
    }
}

#Preview {
    IMCView()
}
