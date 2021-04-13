//
//  Circles.swift
//  newsapp
//
//  Created by AJ Natzic on 4/11/21.
//

import Foundation
import SwiftUI

struct CirclesView : View {
    
    let angle : CGFloat = 40
    let radius : CGFloat
    let speed : Double
    let scale : CGFloat
    let isPressed : Bool
    
    let colors = [#colorLiteral(red: 0.9568627477, green: 0.7246241045, blue: 0.6286502079, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.6321644531, blue: 0.7319221681, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.7328718878, blue: 0.6570692674, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.6530110473, blue: 0.7002155785, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)]
    
    var body: some View {
        ZStack {
            ForEach (0..<9) { num in
                Circle()
                    .fill(Color(self.colors[num]))
                    .frame(width: 10)
                    .scaleEffect(self.isPressed ? 0.1 : self.scale)
                    .animation(.linear(duration: self.speed))
                    .offset(x:  self.radius * cos(CGFloat(num) * self.angle * .pi / 180), y: self.radius * sin(CGFloat(num) * self.angle * .pi / 180))
            }
        }
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CirclesView(radius: 35.0, speed: 22, scale: 2, isPressed: true)
        }
    }
}
