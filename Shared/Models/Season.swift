//
//  Season.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 16/01/2022.
//

import Foundation

struct Season: Identifiable, Equatable {
    
    let id = UUID()
    let title: String
    let name: String
    let episodes: [Episode]
    
    var formattedTitle: String {
        title + "" + name
    }
}
