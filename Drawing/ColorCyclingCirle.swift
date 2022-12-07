//
//  ColorCyclingCirle.swift
//  Drawing
//
//  Created by Roman on 12/7/22.
//

import SwiftUI



struct ColorCyclingCirle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack{
            ForEach(0 ..< steps){
                value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1),lineWidth: 2)
            }
        }
        // this will use Metal to speed up performance.
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color{
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct ColorCircleView: View{
    @State private var colorCycle = 0.0
    var body: some View{
        VStack{
            ColorCyclingCirle(amount: colorCycle)
            Circle()
                .inset(by: 120)
                .strokeBorder(Color(hue: 0.9,saturation: 1, brightness: 1), lineWidth: 25)
            Slider(value: $colorCycle)
        }
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView()
    }
}
