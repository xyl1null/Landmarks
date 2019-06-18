//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Shane Leigh on 17/06/2019.
//  Copyright © 2019 SoundWorm LLC. All rights reserved.
//

import SwiftUI

struct HikeBadge : View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

#if DEBUG
struct HikeBadge_Previews : PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
#endif
