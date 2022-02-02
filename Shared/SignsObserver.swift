//
//  SignsObserver.swift
//  CastleRockCodeChallenge2022
//
//  Created by Bri on 2/1/22.
//

import Foundation

class SignsObserver: ObservableObject {
    
    @Published public var signs: [Sign] = []
    
    func getSigns() async throws {
        
        guard let url = URL(string: "https://idtg.carsprogram.org/signs_v1/api/signs") else {
            throw SignsError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        
        let newSigns = try decoder.decode([Sign].self, from: data)
        
        await setSigns(newSigns)
    }
    
    @MainActor func setSigns(_ newSigns: [Sign]) {
        for newSign in newSigns {
            guard let index = signs.firstIndex(of: newSign) else {
                signs.append(newSign)
                continue
            }
            signs[index] = newSign
        }
    }
}
