//
//  Arc.swift
//  Drawing
//
//  Created by Roman on 12/2/22.
//

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        return path
    }
}

struct Arc: Shape, InsettableShape{
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - insetAmount, startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise )
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape{
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}
struct Arc_View: View {
    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(25), clockwise: true)
            .strokeBorder(.blue,lineWidth: 40)
        
        
    }
}

struct Arc_Previews: PreviewProvider {
    static var previews: some View {
        Arc_View()
    }
}
