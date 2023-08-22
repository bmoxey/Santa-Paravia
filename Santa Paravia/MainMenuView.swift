//
//  MainMenuView.swift
//  Santa Paravia
//
//  Created by Brett Moxey on 22/8/2023.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        TabView {
            Group {
                Text("FeedView")
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                Text("SearchView")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                Text("Upload Post")
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                Text("Notification")
                    .tabItem {
                        Image(systemName: "heart")
                    }
                Text("ProfileView")
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color(red: 0.5, green: 1, blue: 1), for: .tabBar)
        }
        .accentColor(Color(red: 1, green: 0.5, blue: 0.5))

    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
