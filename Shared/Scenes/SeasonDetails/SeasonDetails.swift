//
//  SeasonDetails.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 16/01/2022.
//

import SwiftUI

struct SeasonDetailsView: View {
    
    let viewModel: SeasonDetailViewModel
    
    var body: some View {
        List(viewModel.season.episodes) { episode in
            NavigationLink {
                TrackDetails(viewModel: TrackDetailsViewModel(track: episode.track))
            } label: {
                VStack(alignment: .leading) {
                    HStack() {
                        makePlayButton(for: episode)
                        Text(episode.formattedTitle)
                            .font(.headline)
                        Spacer()
                    }
                    Spacer()
                    Text(episode.track.description)
                        .font(.body)
                        .foregroundColor(Color(UIColor.darkText))
                        .lineLimit(5)
                }
            }
        }
    }
    
    private func makePlayButton(for episode: Episode) -> some View {
        Button {
            viewModel.play(episode: episode)
        } label: {
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 26, height: 26, alignment: .leading)
                .foregroundColor(Color(UIColor.systemBlue))
        }
    }
}
