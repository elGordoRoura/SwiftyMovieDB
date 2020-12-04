//
//  SearchBar.swift
//  SwiftyMovieDB
//
//  Created by Christopher J. Roura on 11/7/20.
//


import SwiftUI

struct SearchBarView: UIViewRepresentable {

    let placeholder: String
    @Binding var text: String
    
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar                           = UISearchBar(frame: .zero)
        searchBar.placeholder                   = placeholder
        searchBar.searchBarStyle                = .minimal
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate                      = context.coordinator
        searchBar.setValue("Dismiss", forKey: "cancelButtonText")
        return searchBar
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }
    
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
    
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text                   = searchText
            searchBar.showsCancelButton = true
        }
        
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
     
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            text.removeAll()
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
        }
    }
}
