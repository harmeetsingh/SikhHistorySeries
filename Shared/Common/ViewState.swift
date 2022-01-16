//
//  ViewState.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 15/01/2022.
//

import Foundation

enum ViewState<Content: Equatable>: Equatable {
    case idle
    case loading
    case loaded(Content)
    case error
}
