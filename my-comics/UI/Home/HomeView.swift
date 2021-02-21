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
    // TODO: - ViewModel経由で取得
    @State var isShowingEdit = false

    // MARK: - body
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
            .navigationBarItems(trailing: Button(action: {
                self.isShowingEdit.toggle()
            }) {
                Image(systemName: "pencil.tip.crop.circle.badge.plus")
            }
            .sheet(isPresented: $isShowingEdit) {
                ComicEditView()
            })
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
