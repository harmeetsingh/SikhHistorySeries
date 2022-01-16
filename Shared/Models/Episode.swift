//
//  Episode.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 16/01/2022.
//

import Foundation

struct Episode: Identifiable, Equatable {
    
    let id = UUID()
    let title: String
    let track: Track
    
    var formattedTitle: String {
        track.title.trimmingCharacters(in: .whitespaces)
    }
}
