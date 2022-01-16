//
//  HomeTabView.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 16/01/2022.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationTitle("Home")
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            Text("History")
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
        }
    }
}
