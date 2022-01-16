//
//  TracksContainer.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 15/01/2022.
//

import Foundation

struct TracksContainer: Decodable {
    
    private enum CodingKeys: CodingKey {
        case collection
    }
    
    private struct Collection: Decodable {
        let track: Track
    }
    
    let tracks: [Track]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let collectionContainer = try container.decode([Collection].self, forKey: .collection)
        tracks = collectionContainer.map { $0.track }
    }
}
