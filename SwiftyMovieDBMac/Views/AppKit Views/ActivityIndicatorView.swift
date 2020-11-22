//
//  ActivityIndicatorView.swift
//  SwiftyMovieDB
//
//  Created by Christopher J. Roura on 11/7/20.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: NSViewRepresentable {
    
    func makeNSView(context: Context) -> NSProgressIndicator {
        let indicator = NSProgressIndicator()
        indicator.style = .spinning
        indicator.startAnimation(nil)
        return indicator
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        
    }
}
