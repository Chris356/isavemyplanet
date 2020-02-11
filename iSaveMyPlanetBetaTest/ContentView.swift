//
//  ContentView.swift
//  iSaveMyPlanetBetaTest
//
//  Created by TURPIN Christophe on 10/02/2020.
//  Copyright © 2020 TURPIN Christophe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack (){
        TabView {
            NavigationView {
                SearchBar(text: $searchText)
            }
            
        .tabItem {
            Image(systemName: "book")
        }
        
        Text("la page avec la carte des events")
            .tabItem{
                Image(systemName: "location")
        }
        
        Text("la page des favoris articles et events")
            .tabItem{
                Image(systemName: "star")
        }
        
        Text("la page d'accès au jeu")
            .tabItem {
                Image(systemName: "gamecontroller")
                }
        
        Text("profile")
            .tabItem {
                Image(systemName: "person.crop.circle")
        }
    }
        }
    }
}
struct SearchBar: UIViewRepresentable {

    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
struct apercuArticle {
    @State private var photo: String //logo de l'organisme
    @State private var name: String // Nom de l'organisme
    @State private var title: String // titre de l'article
    @State private var resume: String //
    @State private var favoris: String
    @State private var date: Date
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone 11"], id: \.self) { deviceName in
            ContentView().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
    }
}
