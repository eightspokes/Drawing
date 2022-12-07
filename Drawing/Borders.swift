//
//  SwiftUIView.swift
//  Drawing
//
//  Created by Roman on 12/2/22.
//

import SwiftUI

struct Border: View {
    var body: some View {
        VStack{
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Joy"), sourceRect: CGRect(x: 0, y: 0, width: 1, height: 0.2), scale: 2), width: 50)
            
            Capsule()
                .strokeBorder(ImagePaint(image: Image("Joy"), sourceRect: CGRect(x: 0, y: 0, width: 1, height: 0.2), scale: 2), lineWidth: 50)
                .frame(width: 300, height: 300)
          
            
       
        }
    }
}

struct Borders_Previews: PreviewProvider {
    static var previews: some View {
        Border()
    }
}
