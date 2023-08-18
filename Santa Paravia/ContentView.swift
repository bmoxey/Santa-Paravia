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
let gameLevelName = ["Apprentice", "Journeyman", "Master", "Grand Master"]


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
    @State var gameLevel: Double = 0.0
    @State var gameStarted: Bool = false
    
    var body: some View {
        if gameStarted {
            Text("Started")
        } else {
            GetPlayersView(viewModel: PlayerDetailViewModel(), gameStarted: $gameStarted, gameLevel: $gameLevel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
