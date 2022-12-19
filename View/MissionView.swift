//
//  MissionView.swift
//  MoonShotApp
//
//  Created by Artem Vinogradov on 18.12.2022.
//

import SwiftUI

struct MissionView: View {
// I remove CrewMember and made new model file in Model folder. You don't need to make it more then one time. Now it is reusable file.
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.55)
                        .padding(.top)
                    
                    Text(mission.formattedLaunchDate )
                        .font(.body)
                        .foregroundColor(.white.opacity(0.5))
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(CustomColor.mySecondtColor)
                        
                        Text("Mission Highlights")
                            .font(.largeTitle.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                            .font(.body)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(CustomColor.mySecondtColor)
                        
                        Text("Crew")
                            .font(.largeTitle.bold())
                            .padding(.bottom, 5)
                        
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal)
// Made this block of code uncomment becouse of now it works good
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
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(CustomColor.myFirstColor)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

