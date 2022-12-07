//
//  Circle.swift
//  Drawing
//
//  Created by Roman on 12/5/22.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
          //  .stroke(.blue,lineWidth: 40)
            .strokeBorder(.blue,lineWidth: 40)
        
    }
    
    struct Circle_Previews: PreviewProvider {
        static var previews: some View {
            CircleView()
        }
    }
}
