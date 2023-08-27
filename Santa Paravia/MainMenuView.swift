//
//  MainMenuView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 22/8/2023.
//

import SwiftUI

struct MainMenuView: View {
    
    @ObservedObject var viewModel: PlayerDetailViewModel  // Pass the existing ViewModel from ContentView
    @Binding var gameLevel: Double
    @State private var currentPlayer: Int = 1
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.cyan.gradient)
                .ignoresSafeArea()
            VStack {
                Text("Santa Paravia and Fiumaccio")
                    .font(.title)
                    .padding(.top)
                Text("Overall standings")
                    .font(.title2)
                    .padding(.bottom)
                HStack {
                    Spacer().frame(width: 60).padding(.leading)
                    Text("Nobles").frame(width: 60)
                    Spacer()
                    Text("Soldiers").frame(width: 70)
                    Spacer()
                    Text("Clergy").frame(width: 60)
                    Spacer()
                    Text("Merchants").frame(width: 90)
                }
                HStack {
                    Spacer().frame(width: 60).padding(.leading)
                    Text("Serfs").frame(width: 60)
                    Spacer()
                    Text("Land").frame(width: 60)
                    Spacer()
                    Text("Treasury").frame(width: 90)
                }
                ScrollView {
                    
                    ForEach(viewModel.playerDetails.indices, id: \.self) { index in
                        PlayerStatusView(player: $viewModel.playerDetails[index], currentPlayer: $currentPlayer, maxPlayers: $viewModel.playerDetails.count)
                    }
                    Spacer()
                }
            }
        }
        
    }
}

