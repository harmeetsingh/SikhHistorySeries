//
//  Array+Extension.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 16/01/2022.
//

import Foundation

extension Array where Element == Track {
    
    func mapSeason() -> [Season] {

        reduce([Season]()) { result, track in
            
            let components = track.title.components(separatedBy: .whitespaces)
            let seasonTitle = "\(components[0]) \(components[1])".replacingOccurrences(of: ":", with: "")
            let seasonName = track.title.replacingOccurrences(of: seasonTitle, with: "")
            
            if let seasonIndex = result.firstIndex(where: { $0.title == seasonTitle }) {
                
                var mutableResult = result
                let existingSeason = mutableResult[seasonIndex]
                
                let episodeComponents = track.title
                    .replacingOccurrences(of: seasonTitle, with: "")
                    .components(separatedBy: .whitespaces)
            
                let episodeIndex = episodeComponents.firstIndex(where: { $0.lowercased() == "episode" })!
                let episodeTitle = "\(episodeComponents[episodeIndex]) \(episodeComponents[episodeIndex + 1])"
                
                if let _ = existingSeason.episodes.first(where: { $0.title == episodeTitle })  {
                    // episode exists inside existing season
                    return mutableResult
                } else {
                    // episode doesn't exists inside existing season
                    let episode = Episode(title: episodeTitle, track: track)
                    let newEpisodes = existingSeason.episodes + [episode]
                    mutableResult[seasonIndex] = Season(title: seasonTitle, name: seasonName, episodes: newEpisodes.compactMap { $0 })
                    return mutableResult
                }
                
            } else {
                var mutableResult = result
                let season = Season(title: seasonTitle, name: seasonName, episodes: [Episode]())
                mutableResult.append(season)
                return mutableResult
            }
        }
    }
}
