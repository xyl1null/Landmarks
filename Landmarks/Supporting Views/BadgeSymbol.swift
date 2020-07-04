//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Shane Leigh on 16/06/2019.
//  Copyright © 2019 SoundWorm LLC. All rights reserved.
//

import SwiftUI

struct BadgeSymbol : View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let midlle = width / 2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: midlle, y: spacing),
                    CGPoint(x: midlle - topWidth, y: topHeight - spacing),
                    CGPoint(x: midlle, y: topHeight / 2 + spacing),
                    CGPoint(x: midlle + topWidth, y: topHeight - spacing),
                    CGPoint(x: midlle, y: spacing),
                ])
                
                path.move(to: CGPoint(x: midlle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: midlle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: midlle + topWidth, y: topHeight + spacing),
                    CGPoint(x: midlle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

#if DEBUG
struct BadgeSymbol_Previews : PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
#endif
