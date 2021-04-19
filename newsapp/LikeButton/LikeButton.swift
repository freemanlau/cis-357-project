//
//  LikeButton.swift
//  newsapp
//
//  Created by AJ Natzic on 4/11/21.
//

import Foundation
import SwiftUI

struct LikeButton : View {
    @State var isPressed = false
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.pink)
                .opacity(isPressed ? 1 : 0)
                .scaleEffect(isPressed ? 1.0 : 0.1)
                .animation(.linear)
            
            Image(systemName: "heart")
                .foregroundColor(.black)
            
            CirclesView(radius: 35, speed: 0.1, scale: 0.7, isPressed: isPressed)
                .opacity(self.opacity)
            
            CirclesView(radius: 55, speed: 0.2, scale: 0.5 , isPressed: isPressed)
                .opacity(self.opacity)
                .rotationEffect(Angle(degrees: 20))
        }
        .onTapGesture {
            self.isPressed.toggle()
            withAnimation (.linear(duration: 0.2)) {
                self.scale = self.scale == 1 ? 1.3 : 1
                self.opacity = self.opacity == 0 ? 1 : 0
            }
            withAnimation {
                self.opacity = self.opacity == 0 ? 1 : 0
            }
        }
        .scaleEffect(self.scale)
    }
    
    
    struct LikeButton_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                LikeButton()
            }
        }
    }
    
    
}
