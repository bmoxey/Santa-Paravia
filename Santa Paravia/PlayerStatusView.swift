//
//  PlayerStatusView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 24/8/2023.
//

import SwiftUI

struct PlayerStatusView: View {
    @Binding var player: PlayerStruct
    @Binding var currentPlayer: Int
    let maxPlayers: Int
    
    var body: some View {
        HStack {
            Text("\(player.title) \(player.name) of \(player.city)")
                .font(.title3)
                .padding(.horizontal)
            Spacer()
            if player.number == currentPlayer {
                Button {
                    currentPlayer += 1
                    if currentPlayer > maxPlayers {
                        currentPlayer = 1
                    }
                } label: {
                    HStack {
                        Text("Play turn")
                        Image(systemName: "chevron.right")

                    }
                    .padding(.horizontal)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
        HStack {
            Image("pic111")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.leading)
            VStack {
                HStack  {
                    Text("\(player.nobles)").frame(width: 60)
                    Spacer()
                    Text("\(player.soldiers)").frame(width: 70)
                    Spacer()
                    Text("\(player.clergy)").frame(width: 60)
                    Spacer()
                    Text("\(player.merchants)").frame(width: 90)
                }
                HStack {
                    Text("\(player.serfs)").frame(width: 60)
                    Spacer()
                    Text("\(player.land)").frame(width: 60)
                    Spacer()
                    Text("\(player.treasury)").frame(width: 90)
                }
            }
        }
        Divider()
    }
}

