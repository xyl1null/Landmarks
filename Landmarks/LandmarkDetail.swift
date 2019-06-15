//
//  ContentView.swift
//  Landmarks
//
//  Created by Shane Leigh on 15/06/2019.
//  Copyright © 2019 SoundWorm LLC. All rights reserved.
//

import SwiftUI

struct LandmarkDetail : View {
    
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                // allow the map content to extend to the top edge of the screen
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image(forSize: 250))
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: landmark.name)
                        .font(.title)
                        .color(.black)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavourite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavourite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                
                
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
//        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
#endif
