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
            HelpScreen()
            
        }
    }
}
