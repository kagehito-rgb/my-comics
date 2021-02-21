//
//  DateTextView.swift
//  my-comics
//
//  Created by kagehito on 2021/02/22.
//

import SwiftUI

/// 日付文字列を表示するView。
struct DateTextView: View {
    var date: Date
    var format: DateFormatter

    init(
        date: Date,
        format: DateFormatter = DateFormatBuilder().build()
    ) {
        self.date = date
        self.format = format
    }

    var body: some View {
        Text(format.string(from: date))
    }
}

class DateFormatBuilder {
    private(set) var dateStyle: DateFormatter.Style = .long
    private(set) var locale: Locale = Locale(identifier: "ja_JP")

    public func setDateStyle(_ style: DateFormatter.Style) {
        dateStyle = style
    }

    public func setLocale(_ loc: Locale) {
        locale = loc
    }

    public func build() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.locale = locale
        return dateFormatter
    }
}

struct DateTextView_Previews: PreviewProvider {
    static var previews: some View {
        DateTextView(
            date: Date(),
            format: DateFormatBuilder().build()
        )
    }
}
