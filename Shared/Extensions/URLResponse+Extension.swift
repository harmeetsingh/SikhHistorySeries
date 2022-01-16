//
//  URLResponse+Extension.swift
//  SikhHistorySeries (iOS)
//
//  Created by Harmeet Singh on 15/01/2022.
//

import Foundation

extension URLResponse {
    
    var isSuccessful: Bool {
        let httpResponse = self as? HTTPURLResponse
        return 200...299 ~= httpResponse?.statusCode ?? 0
    }
}
