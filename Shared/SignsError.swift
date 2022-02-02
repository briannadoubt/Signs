//
//  SignsError.swift
//  CastleRockCodeChallenge2022
//
//  Created by Bri on 2/1/22.
//

import Foundation

enum SignsError: Error {
    
    case invalidURL
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL... Better check ur code Bri cause it's only hardcoded values here :p"
        }
    }
}
