//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Shane Leigh on 15/06/2019.
//  Copyright © 2019 SoundWorm LLC. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavouritesOnly) {
                Text("Favourites Only")
            }
            
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavouritesOnly || landmark.isFavourite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone 11 Pro Max"], id: \.self) { deviceName in
            NavigationView {
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
            }
        }
        .environmentObject(UserData())
    }
}
