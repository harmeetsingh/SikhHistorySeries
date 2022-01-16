//
//  HomeViewModel.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 15/01/2022.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    enum ContentType: Equatable {
        case season(Season)
        case track(Track)
        
        var title: String {
            switch self {
            case .season(let season):
                return season.title
            case .track(let track):
                return track.title
            }
        }
    }
    
    @Published var state: ViewState<[ContentType]> = .idle
    private let networkSession = URLSession.shared
    
    func onAppear() {
        state = .loading

        guard let url = URL(string: API.allTracks) else { return }
        networkSession.dataTask(with: url) { [weak self] data, response, error in

            DispatchQueue.main.async {
                self?.handleResponse(with: data, response: response, error: error)
            }
        }.resume()
    }
    
    private func handleResponse(with data: Data?, response: URLResponse?, error: Error?) {
        
        guard let data = data, let response = response, response.isSuccessful else {
            state = .error
            return
        }

        do {
            let container = try JSONDecoder().decode(TracksContainer.self, from: data)

            let tracks = container.tracks
                .filter { !$0.isSeason }
                .map { ContentType.track($0) }

            let seasons = container.tracks
                .filter { $0.isSeason }
                .mapSeason()
                .map { ContentType.season($0) }

            let content = tracks + seasons
            self.state = .loaded(content)
        } catch _ {
            self.state = .error
        }
    }
}
