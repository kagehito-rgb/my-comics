//
//  ComicEditView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/17.
//

import SwiftUI

/// 漫画の情報を編集するView
struct ComicEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ComicEditViewModel = ComicEditViewModel()
    @State var comic: ComicEntity

    // MARK: - body
    /// - Remark
    /// 外部から環境変数(EnvironmentValues)設定してもなんか効かない(DatePicker)
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                Spacer().frame(height: 4)
                VStack(alignment: .leading) {
                    Text("タイトル")
                    TextField("タイトルを入力してください", text: $comic.title)
                }
                Stepper(value: $comic.haveVolume) {
                    Text("所持している巻数:  \(comic.haveVolume)")
                }
                Stepper(value: $comic.publishedVolume) {
                    Text("既刊:  \(comic.publishedVolume)")
                }
                HStack {
                    Text("次巻予定日").frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    DatePicker(
                        "次巻予定日",
                        selection: $comic.nextReleaseDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
                    .frame(width: 80, height: 40, alignment: .trailing)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                }
                Spacer()
            }
            .navigationBarTitle("Edit", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            }, trailing: Button(action: {
                viewModel.update(entity: comic)
            }) {
                Text("Save")
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
        }
    }
}

struct ComicEditView_Previews: PreviewProvider {
    static var previews: some View {
        ComicEditView(comic: ComicEntity())
    }
}
