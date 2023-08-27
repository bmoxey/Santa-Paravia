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
                .padding(.leading)
            if player.number == currentPlayer {
                Button {
                    currentPlayer += 1
                    if currentPlayer > maxPlayers {
                        currentPlayer = 1
                    }
                } label: {
                    Text("Play turn")
                        .fontWeight(.semibold)
                        .frame(width: 100, height: 30)
                        .foregroundColor(.black)
                        .background(Color(.green))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            Spacer()
        }
        HStack {
            Image("pic111")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.leading)
            VStack {
                HStack  {
                    Spacer()
                    VStack {
                        Text("Nobles:")
                        Text("\(player.nobles)")
                    }
                    Spacer()
                    VStack {
                        Text("Soldier:")
                        Text("\(player.soldiers)")
                    }
                    Spacer()
                    VStack {
                        Text("Clergy:")
                        Text("\(player.clergy)")
                    }
                    Spacer()
                    VStack {
                        Text("Merchant:")
                        Text("\(player.merchants)")
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Serfs:")
                        Text("\(player.serfs)")
                    }
                    Spacer()
                    VStack {
                        Text("Land:")
                        Text("\(player.land)")
                    }
                    Spacer()
                    VStack {
                        Text("Treasury:")
                        Text("\(player.treasury)")
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        Divider()
    }
}

