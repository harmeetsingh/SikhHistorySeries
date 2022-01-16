//
//  Track.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 15/01/2022.
//

import Foundation

struct Track: Decodable, Equatable {

    let title: String
    let description: String

    var isSeason: Bool {
        let components = title.components(separatedBy: .whitespaces)
        return components.first?.lowercased() == "season"
    }
}
