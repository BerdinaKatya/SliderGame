//
//  ContentView.swift
//  SliderGame
//
//  Created by Ekaterina Teliauberdina on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Float.random(in: 0...100)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var alphaValue = 1.0
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                
                UISliderRepresentation(
                    sliderValue: $sliderValue,
                    targetValue: $targetValue,
                    alphaValue: $alphaValue
                )
                
                Text("100")
            }.padding(.top, 20)
            
            Button(action: {isAlertPresented.toggle()}, label: {
                Text("Проверь меня!")
            })
            .padding(.top, 10)
            .alert(
                "Ваш результат",
                isPresented: $isAlertPresented,
                actions: {}) {
                    Text("\(computeScore())")
                }
            
            Button(
                action: {
                    targetValue = Int.random(in: 0...100)
                    sliderValue = Float.random(in: 0...100)
                },
                label: {
                Text("Начать заново")
            })
            .padding(.top, 8)
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(sliderValue)))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
