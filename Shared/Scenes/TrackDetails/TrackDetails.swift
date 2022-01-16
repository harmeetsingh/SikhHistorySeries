//
//  TrackDetails.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 16/01/2022.
//

import SwiftUI

struct TrackDetails: View {
    
    let viewModel: TrackDetailsViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "app.fill")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .padding(.bottom)
            Text("Publish Date")
                .font(.subheadline)
                .padding(.bottom)
            playButton
                .padding(.bottom)
            Divider()
            ZStack {
                Text(viewModel.track.description)
                    .font(.body)
            }
        }
    }
    
    private var playButton: some View {
        Button {
            viewModel.play()
        } label: {
            HStack {
                Image(systemName: "play")
                    .resizable()
                    .frame(width: 18, height: 18, alignment: .leading)
                    .foregroundColor(Color(UIColor.systemBlue))
                Text("Play")
            }
            .foregroundColor(Color(uiColor: .systemBlue))
        }
    }
}
