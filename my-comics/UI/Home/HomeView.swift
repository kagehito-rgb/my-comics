//
//  HomeView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// Home画面
struct HomeView: View {

    @State var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                SearchBar(text: $searchText)
                Spacer()
                ComicList()
            }
            .navigationBarTitle(
                "Home",
                displayMode: .inline
            )
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
