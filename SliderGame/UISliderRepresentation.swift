//
//  SliderRepresentation.swift
//  SliderGame
//
//  Created by Ekaterina Teliauberdina on 24.10.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    @Binding var targetValue: Int
    @Binding var alphaValue: Int
    let action: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = sliderValue
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = UIColor(
            red: 255 / 255,
            green: 1 / 255,
            blue: 1 / 255,
            alpha: CGFloat(Double(action) / Double(alphaValue))
        )
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}
