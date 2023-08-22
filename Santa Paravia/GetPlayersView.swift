//
//  GetPlayersView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 19/8/2023.
//

import SwiftUI

struct GetPlayersView: View {
    @ObservedObject var viewModel = PlayerDetailViewModel()
    @Binding var gameStarted: Bool
    @Binding var gameLevel: Double
    @State private var showInstructions = false
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.cyan.gradient)
                .ignoresSafeArea()
            VStack {
                Group {
                    Text("Welcome to")
                        .font(.title)
                        .padding(.top)
                    Text("Santa Paravia")
                        .font(.system (size: 42))
                    Text("and Fiumaccio")
                        .font(.system (size: 42))
                    Text("How many people want to play?")
                        .padding(.top)
                        .font(.title3)
                }
                ForEach(viewModel.playerDetails.indices, id: \.self) { index in
                    PlayerDetailView(player: $viewModel.playerDetails[index])
                }
                HStack {
                    if viewModel.playerDetails.count < 6 {
                        Button {
                            viewModel.addPlayer()
                        } label: {
                            Text("Add Player")
                                .fontWeight(.semibold)
                                .frame(width: 150, height: 30)
                                .foregroundColor(.white)
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    if viewModel.playerDetails.count > 1 {
                        Button {
                            viewModel.removeLastPlayer()
                        } label: {
                            Text("Remove Player")
                                .fontWeight(.semibold)
                                .frame(width: 150, height: 30)
                                .foregroundColor(.white)
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                    
                }
                Text("Desired level of play: \(gameLevelName[Int(gameLevel)])")
                Slider(value: $gameLevel, in: 0...3, step: 1)
                .padding(.horizontal)
                HStack {
                    Button {
                        showInstructions.toggle()
                    } label: {
                        Text("Instructions")
                            .fontWeight(.semibold)
                            .frame(width: 150, height: 30)
                            .foregroundColor(.black)
                            .background(Color(.green))
                            .cornerRadius(10)
                    }
                    Button {
                        gameStarted = true
                    } label: {
                        Text("Continue")
                            .fontWeight(viewModel.isContinueDisabled ? .light : .semibold)
                            .frame(width: 150, height: 30)
                            .foregroundColor(viewModel.isContinueDisabled ? .white : .black)
                            .background(viewModel.isContinueDisabled ? Color.gray : Color(.green))
                            .cornerRadius(10)
                    }
                    .disabled(viewModel.isContinueDisabled)
                    .padding()
                }
                Spacer()
            }
            .onAppear {
                viewModel.addPlayer()
            }
        }
        .sheet(isPresented: $showInstructions) {
            ZStack {
                ContainerRelativeShape()
                    .fill(Color.green.gradient)
                    .ignoresSafeArea(.container)
                VStack {
                    Text("Santa Paravia and Fiumaccio")
                        .font(.title)
                    Text("You are the ruler of a 15th century Italian city-state. If you rule well, you will receive higher titles. The first player to become king or queen wins. Life expectancy then was breif, so you may not live long enough to win. The computer will draw a map of your state. The size of the area in the wall grows as you buy more land. The size of the guard tower in the upper left corner shows the adeqacy of your defenses. If it shrinks, equip more soldiers! If the plowman is touching the top wall, all your land is in production. Otherwise you need more serfs, who will migrate to your state if you distribute more grain than the minimum demand. If you distribute less grain, some of your people will starbe, and you will have a high death rate. High taxes raise money, but slow down economic growth")
                        .padding()
                    Text("Press CONTINUE to begin game")

                }

            }
                
        }
    }
}
