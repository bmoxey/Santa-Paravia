//
//  ContentView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 18/8/2023.
//

import SwiftUI

struct PlayerStruct: Identifiable {
    let id = UUID()
    var number: Int = 0
    var name: String = ""
    var city: String = ""
    var level: Int = 1
    var isMale: Bool = true
    var title: String {
        guard level >= 0, level < male.count else {
            return "Unknown"
        }
        return isMale ? male[level] : female[level]
    }
}

let cities = ["Santa Paravia", "Fiumaccio", "Torricella", "Molinetto", "Fontanile", "Romagna"]
let male = ["Sir", "Baron", "Count", "Marquis", "Duke", "Grand Duke", "Prince", "* H.R.H. King"]
let female = ["Lady", "Baroness", "Countess", "Marquise", "Duchess", "Grand Duchess", "Princess", "* H.R.H. Queen"]


class PlayerDetailViewModel: ObservableObject {
    @Published var playerDetails: [PlayerStruct] = []
    
    func addPlayer() {
        playerDetails.append(PlayerStruct(number: playerDetails.count + 1, city: cities[playerDetails.count], level: 0))
    }
    
    func removeLastPlayer() {
        if !playerDetails.isEmpty {
            playerDetails.removeLast()
        }
    }
    
    var isContinueDisabled: Bool {
        playerDetails.contains { $0.name.isEmpty }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = PlayerDetailViewModel()
    @State var year = 1400
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.cyan.gradient)
                .ignoresSafeArea()
            VStack {
                Text("Welcome to")
                    .font(.title)
                    .padding(.top)
                Text("Santa Paravia")
                    .font(.system (size: 48))
                Text("and Fiumaccio")
                    .font(.system (size: 48))
                Text("How many people want to play?")
                    .padding(.vertical)
                    .font(.title3)
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
                Button {
                    print("Continue")
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
                Spacer()
            }
            .onAppear {
                viewModel.addPlayer()
            }
        }
    }
}

struct PlayerDetailView: View {
    @Binding var player: PlayerStruct
    var body: some View {
        
        VStack {
            HStack {
                Text("\(player.number).")
                    .padding(.leading)
                Text("\(player.title)")
                    .frame(width: 40)
                TextField("Name", text: $player.name)
                    .frame(width: 120, height: 30)
                    .border(.foreground)
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
            Divider()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
