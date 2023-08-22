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
            .accentColor(.cyan)
            }

    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
