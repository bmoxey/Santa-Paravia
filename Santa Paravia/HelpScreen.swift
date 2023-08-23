//
//  HelpScreen.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 24/8/2023.
//

import SwiftUI

struct HelpScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.green.gradient)
                .ignoresSafeArea(.container)
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
                Text("Santa Paravia and Fiumaccio")
                    .font(.title)
                Text("You are the ruler of a 15th century Italian city-state. If you rule well, you will receive higher titles. The first player to become king or queen wins. Life expectancy then was breif, so you may not live long enough to win. The computer will draw a map of your state. The size of the area in the wall grows as you buy more land. The size of the guard tower in the upper left corner shows the adeqacy of your defenses. If it shrinks, equip more soldiers! If the plowman is touching the top wall, all your land is in production. Otherwise you need more serfs, who will migrate to your state if you distribute more grain than the minimum demand. If you distribute less grain, some of your people will starbe, and you will have a high death rate. High taxes raise money, but slow down economic growth")
                    .padding()
                HStack {
                    Text("Press")
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("CONTINUE")
                            .foregroundColor(.black)
                    }
                    Text("to begin game")

                }
                Spacer()
            }
            
        }
 
    }
}

struct HelpScreen_Previews: PreviewProvider {
    static var previews: some View {
        HelpScreen()
    }
}
