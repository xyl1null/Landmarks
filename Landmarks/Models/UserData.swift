//
//  UserData.swift
//  Landmarks
//
//  Created by Shane Leigh on 15/06/2019.
//  Copyright © 2019 SoundWorm LLC. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
//    let didChange = PassthroughSubject<UserData, Never>()
//
//    var showFavouritesOnly = false {
//        didSet {
//            didChange.send(self)
//        }
//    }
//
//    var landmarks = landmarkData {
//        didSet {
//            didChange.send(self)
//        }
//    }
    @Published var showFavouritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}

