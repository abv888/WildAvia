//
//  String+Extension.swift
//  WildAvia
//
//  Created by Bagrat Arutyunov on 19.09.2023.
//

import Foundation

extension String {
    func convertDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +SSSS Z"
        let formattedDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "EEEE, d MMM HH:mm"
        return dateFormatter.string(from: formattedDate ?? Date())
    }
}
