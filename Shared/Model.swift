//
//  Model.swift
//  CastleRockCodeChallenge2022
//
//  Created by Bri on 2/1/22.
//

import Foundation

struct Sign: Codable, Identifiable, Equatable {
    var lastUpdated: Date
    var agencyId: String?
    var idForDisplay: String?
    var display: Display
    var agencyName: String?
    var status: String // TODO: Make this an enum with all known values
    var name: String
    var location: Location?
    var properties: Properties?
    var id: String?
}
    
struct Display: Codable, Equatable {
    
    var pages: [Page]
    
    struct Page: Codable, Equatable {
        var justification: String // TODO: Make this an enum with all known values
        var lines: [String]
    }
}

struct Location: Codable, Equatable {
    
    var cityReference: String?
    var fips: Int?
    var perpendicularRadiansForDirectionOfTravel: Double?
    var latitude: Double?
    var longitude: Double?
    var routeId: String?
    var linearReference: Double?
    var signFacingDirection: String? // TODO: Make this an enum with all known values
    var locationDescription: String?
    
}

struct Properties: Codable, Equatable {
    var maxSignPhases: Int?
    var phaseDwellTime: Int?
    var phaseBlankTime: Int?
    var maxLinesPerPage: Int?
    var maxCharactersPerLine: Int?
    var sizeKnown: Bool?
}
