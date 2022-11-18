//
//  mission .swift
//  MoonShot
//
//  Created by Hamza Osama on 18/11/2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let luchdate: String?
    let crew: [CrewRole]
    let description: String
}
