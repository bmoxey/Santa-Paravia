//
//  PlayerDetailView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 19/8/2023.
//

import SwiftUI

struct PlayerDetailView: View {
    @Binding var player: PlayerStruct
    
    var body: some View {
        
        VStack {
            HStack {
                Image("pic111")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.leading)
                Text("\(player.title)")
                    .frame(width: 38)
                TextField("Name", text: $player.name)
                    .frame(width: 100, height: 25)
                    .textFieldStyle(.roundedBorder)
                Text(" of \(player.city)")
                Button {
                    player.isMale.toggle()
                } label: {
                    VStack {
                        Text(player.isMale ? "♂" : "♀")
                            .foregroundColor(player.isMale ? Color(.blue) : Color(.systemPink))
                        Spacer()
                    }
                    .frame(height: 30)
                }
                
                Spacer()
            }
        }
    }
}

