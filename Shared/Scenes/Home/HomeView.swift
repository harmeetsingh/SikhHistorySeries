//
//  HomeView.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 15/01/2022.
//

import SwiftUI
import Combine

struct HomeView: View {

    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            if case .loading = viewModel.state {
                ProgressView("Loading")
            } else if case .error = viewModel.state {
                errorView
            } else if case .loaded(let items) = viewModel.state {
                makeContentView(with: items)
            }
        }
        .onAppear() { viewModel.onAppear() }
    }
    
    private var errorView: some View {
        Button {
            viewModel.onAppear()
        } label: {
            Text("Something went wrong, please try again.")
        }
    }
    
    private func makeContentView(with items: [HomeViewModel.ContentType]) -> some View {
        List {
            Section("Seasons") {
                ForEach(items, id: \.title) { item in
                    if case .season(let season) = item {
                        NavigationLink(season.formattedTitle) {
                            SeasonDetailsView(viewModel: SeasonDetailViewModel(season: season))
                                .navigationBarTitle(season.title)
                        }
                    }
                }
            }
            Section("Tracks") {
                ForEach(items, id: \.title) { item in
                    if case .track(let track) = item {
                        NavigationLink(track.title) {
                            TrackDetails(viewModel: TrackDetailsViewModel(track: track))
                                .navigationBarTitle(track.title)
                        }
                    }
                }
            }
        }
    }
}
