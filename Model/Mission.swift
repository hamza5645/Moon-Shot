//
//  Mission.swift
//  MoonShotApp
//
//  Created by Artem Vinogradov on 18.12.2022.
//

import Foundation

struct Mission {
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .numeric, time: .omitted) ?? "N/A"
    }
}

// It makes Mission more readable
extension Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
}
