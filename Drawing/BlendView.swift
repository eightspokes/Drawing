//
//  BlandView.swift
//  Drawing
//
//  Created by Roman on 12/7/22.
//

import SwiftUI

struct BlendView: View {
    @State private var amount = 0.0
    var body: some View {
        VStack{
            Image("Joy")
                .resizable()
                .scaledToFit()
                
                .saturation(amount)
                .blur(radius:(1-amount) * 20)
            
//            ZStack{
//                Image("Joy")
//                Rectangle()
//                    .fill(.red)
//                    .blendMode(.multiply)
//            }
//            ZStack{
//               Circle()
//                    .fill(.green)
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                     .fill(.red)
//                     .frame(width: 200 * amount)
//                     .offset(x: 50, y: -80)
//                     .blendMode(.screen)
//                Circle()
//                    .fill(.blue)
//                     .frame(width: 200 * amount)
//                     .blendMode(.screen)
//            }
            .frame(width: 300, height: 300)
            Slider(value: $amount)
                .padding()
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
        
    }
}

struct BlendView_Previews: PreviewProvider {
    static var previews: some View {
        BlendView()
    }
}
