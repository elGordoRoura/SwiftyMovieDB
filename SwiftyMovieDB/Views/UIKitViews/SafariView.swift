//
//  SafariView.swift
//  SwiftyMovieDB
//
//  Created by Christopher J. Roura on 11/7/20.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL

    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
    
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
