//
//  Extensions.swift
//  SwiftyMovieDB
//
//  Created by Christopher J. Roura on 11/7/20.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
