//
//  CrewMembersView.swift
//  MoonShotApp
//
//  Created by Artem Vinogradov on 18.12.2022.
//

import SwiftUI

// Corrected it from crewMembers to CrewMembers. class, struct and others struct of data should be named Upercase
struct CrewMembersView: View {
// I remove CrewMember and made new model file in Model folder. You don't need to make it more then one time. Now it is reusable file.
    
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

struct CrewMembersView_Previews: PreviewProvider {
// It is just preview. You add here blueprint like this or you can delete this struct and see it from ContentView
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let crewsPreview = [
        CrewMember (role: "commander of Apollo 11", astronaut: Astronaut(id: "grissom", name: "Virgil I. \"Gus\" Grissom", description: "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor.")),
        CrewMember (role: "pilot lunar module", astronaut: Astronaut(id: "white", name: "Edward H. White II", description: "Edward Higgins White II (November 14, 1930 – January 27, 1967) (Lt Col, USAF) was an American aeronautical engineer, U.S. Air Force officer, test pilot, and NASA astronaut. On June 3, 1965, he became the first American to walk in space. White died along with astronauts Virgil \"Gus\" Grissom and Roger B. Chaffee during prelaunch testing for the first crewed Apollo mission at Cape Canaveral.\n\nHe was awarded the NASA Distinguished Service Medal for his flight in Gemini 4 and was then awarded the Congressional Space Medal of Honor posthumously."))
    ]
    
    static var previews: some View {
        
        CrewMembersView(mission: missions[0], crew: crewsPreview)
            .preferredColorScheme(.dark)
    }
}
