//
//  Flower.swift
//  Drawing
//
//  Created by Roman on 12/1/22.
//

import SwiftUI

struct Flower_16: Shape {
    var petalOffset : Double
    var petalWidth : Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi/8){
            //Rotate by this angle
            let rotation = CGAffineTransform(rotationAngle: number )
            //adding transform to another transform. Move by half of our drawing space
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            //original patel untransformed
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width/2))
            let rotatedPetal = originalPetal.applying(position)
            path.addPath(rotatedPetal)
            
        }
        return path
    }
    
}

struct Flower: View {
    @State private var petalOffset = -100.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack{
            Flower_16(petalOffset: petalOffset, petalWidth: petalWidth)
                //.stroke(.red, lineWidth: 1)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct Flower_Previews: PreviewProvider {
    static var previews: some View {
        Flower()
    }
}
