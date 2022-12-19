//
//  AstronautView.swift
//  MoonShotApp
//
//  Created by Artem Vinogradov on 18.12.2022.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(CustomColor.myFirstColor)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
// It is just preview. You add here blueprint like this or you can delete this struct and see it from ContentView
    static let astronaut: Astronaut =
        Astronaut(id: "grissom", name: "Virgil I. \"Gus\" Grissom", description: "Virgil Ivan \"Gus\" Grissom (April 3, 1926 – January 27, 1967) was one of the seven original National Aeronautics and Space Administration's Project Mercury astronauts, and the first of the Mercury Seven to die. He was also a Project Gemini and an Apollo program astronaut. Grissom was the second American to fly in space, and the first member of the NASA Astronaut Corps to fly in space twice.\n\nIn addition, Grissom was a World War II and Korean War veteran, U.S. Air Force test pilot, and a mechanical engineer. He was a recipient of the Distinguished Flying Cross, and the Air Medal with an oak leaf cluster, a two-time recipient of the NASA Distinguished Service Medal, and, posthumously, the Congressional Space Medal of Honor.")
    
    static var previews: some View {
        AstronautView(astronaut: astronaut)
    }
}
