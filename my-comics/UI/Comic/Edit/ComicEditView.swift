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
    var editMode: ComicEditMode = ComicEditMode.Edit
    var id: ComicID? = nil

    // MARK: - body
    /// - Remark
    /// 外部から環境変数(EnvironmentValues)設定してもなんか効かない(DatePicker)
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                Spacer().frame(height: 4)
                VStack(alignment: .leading) {
                    Text("タイトル")
                    TextField("タイトルを入力してください", text: $viewModel.comicItem.title)
                }
                Stepper(
                    value: $viewModel.comicItem.haveVolume,
                    in: 1...viewModel.comicItem.publishedVolume
                ) {
                    Text("所持している巻数:  \(viewModel.comicItem.haveVolume)")
                }
                Stepper(
                    value: $viewModel.comicItem.publishedVolume,
                    in: 1...viewModel.comicItem.publishedVolume + 1
                ) {
                    Text("既刊:  \(viewModel.comicItem.publishedVolume)")
                }
                HStack {
                    Text("次巻予定日").frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    DatePicker(
                        "次巻予定日",
                        selection: $viewModel.comicItem.nextReleaseDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(CompactDatePickerStyle())
                    .labelsHidden()
                    .frame(width: 120, height: 40, alignment: .trailing)
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
                switch editMode {
                case .Edit:
                    viewModel.update(item: viewModel.comicItem)
                case .AddNew:
                    viewModel.addNew(item: viewModel.comicItem)
                }
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 16)
            .onAppear {
                if let comicID = id {
                    viewModel.setItem(id: comicID)
                }
            }
        }
    }
}

struct ComicEditView_Previews: PreviewProvider {
    static var previews: some View {
        ComicEditView()
    }
}
