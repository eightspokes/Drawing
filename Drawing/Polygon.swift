//
//  Triangel.swift
//  Drawing
//
//  Created by Roman on 12/5/22.
//

import SwiftUI

struct RectangleView: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to:CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
    
    
}



struct Polygon: Shape{
    
    var sides : Int = 5
    
    func path(in rect: CGRect) -> Path {
        // get the center point and the radius
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2
        
        // get the angle in radian,
        // 2 pi divided by the number of sides
        let angle = Double.pi * 2 / Double(sides)
        var path = Path()
        var startPoint = CGPoint(x: 0, y: 0)
        
        for side in 0 ..< sides {
            
            let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat (radius)
            let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
            
            let vertexPoint = CGPoint( x: x, y: y)
            
            if (side == 0) {
                startPoint = vertexPoint
                path.move(to: startPoint )
            }
            else {
                path.addLine(to: vertexPoint)
            }
            
            // move back to starting point
            // needed for stroke
            if ( side == (sides - 1) ){
                path.addLine(to: startPoint)
            }
        }
        
        return path
    }
}

struct Example_View : View {
    var body: some View {
        //Polygon(sides: 16)
        Triangle()
           
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round,lineJoin: .round))
            .frame(width: 300, height: 300)
    }
}

struct Polygon_Previews: PreviewProvider {
    static var previews: some View {
        Example_View()
          
            .frame(width: 200, height: 200)
            
    }
}
