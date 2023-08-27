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
    var customsTaxRate: Int = 25
    var salesTaxRate: Int = 10
    var wealthTaxRate: Int = 5
    var justiceLevel: Int = 2
    var treasury: Int = 1000
    var land: Int = 10000
    var grainReserves: Int = 5000
    var economicValud: Int = 1
    var nobles: Int = 4
    var soldiers: Int = 25
    var clergy: Int = 5
    var merchants: Int = 25
    var serfs: Int = 2000
    var markets: Int = 0
    var palaces: Int = 0
    var cathedrals: Int = 0
    var woolMills: Int = 0
    var title: String {
        guard level >= 0, level < male.count else {
            return "Unknown"
        }
        return isMale ? male[level] : female[level]
    }
    var pic: String {
        return isMale ? "pic1\(level)\(number)" : "pic2\(level)\(number)"
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
    @State var showInstructions: Bool = false
    
    var body: some View {
        
        if gameStarted {
            MainMenuView(viewModel: viewModel, gameLevel: $gameLevel)
                .transition(.move(edge: .bottom))
        } else {
            GetPlayersView(viewModel: viewModel, gameStarted: $gameStarted, gameLevel: $gameLevel)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
