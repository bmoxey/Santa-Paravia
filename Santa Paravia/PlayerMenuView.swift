//
//  PlayerMenuView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 29/8/2023.
//

import SwiftUI

struct PlayerMenuView: View {
    var body: some View {
        TabView {
            Text("Upload Post")
                        .tabItem {
                            Image("wheat")
                            Text("Harvest")
                        }
                    
            Text("Upload Post")
                        .tabItem {
                            Image("dollar")
                            Text("Revenue")
                        }
                    Text("Upload Post")
                        .tabItem {
                            Image(systemName: "plus.square")
                        }
            Text("Upload Post")
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
                .accentColor(.black)
    }
}

struct PlayerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerMenuView()
    }
}
