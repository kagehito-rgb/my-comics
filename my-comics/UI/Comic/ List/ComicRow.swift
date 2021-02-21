//
//  ComicRow.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// 漫画一覧の列View
struct ComicRow: View {
    // TODO: - ViewModel経由で取得
    @State var isShowingEdit = false

    private let format = DateFormatBuilder().build()

    // MARK: - body
    var body: some View {
        VStack {
            Spacer().frame(height: 16)
            // 一行目 漫画タイトル・所持巻数・既刊数
            HStack {
                Spacer().frame(width: 12)
                Text("漫画タイトル")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                Spacer().frame(width: 16)
                Text("所持巻数\n10巻")
                    .font(.system(size: 12))
                Text("既刊\n11巻")
                    .font(.system(size: 12))
                Spacer().frame(width: 12)
            }
            Spacer().frame(height: 16)
            // 二行目 次巻予定日・編集ボタン・削除ボタン
            HStack {
                Spacer()
                Text("次巻")
                    .font(.system(size: 14))
                DateTextView(date: Date(), format: format)
                    .font(.system(size: 14))
                Spacer().frame(width: 16)
                Image(systemName: "pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.none)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        self.isShowingEdit.toggle()
                    }
                    .sheet(isPresented: $isShowingEdit) {
                        ComicEditView()
                    }
                Spacer().frame(width: 12)
                // TODO: - 削除ボタン(ゴミ箱)タップ時にリスト&DBから削除 -
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.none)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        self.isShowingEdit.toggle()
                    }
                    .sheet(isPresented: $isShowingEdit) {
                        ComicEditView()
                    }
                Spacer().frame(width: 12)
            }
            Spacer().frame(height: 8)
        }
    }
}

struct ComicRow_Previews: PreviewProvider {
    static var previews: some View {
        ComicRow()
    }
}
