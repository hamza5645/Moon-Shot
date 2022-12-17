//
//  crewMembers.swift
//  MoonShot
//
//  Created by Hamza Osama on 17/12/2022.
//

import SwiftUI

struct crewMembers: View {

    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { CrewMember in
                    NavigationLink{
                        AstronautView(astronaut: CrewMember.astronaut)
                    } label: {
                        HStack {
                            Image(CrewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(CrewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(CrewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct crewMembers_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let crewsPreview = [
        CrewMember (role: "commander of Apollo 11", astronaut: "Neil Armstrong"),
        CrewMember (role: "pilot lunar module", astronaut: "Buzz Aldrin")
    ]
    
    static var previews: some View {
        
        crewMembers(mission: missions[0], crew: crewsPreview)
            .preferredColorScheme(.dark)
    }
}
