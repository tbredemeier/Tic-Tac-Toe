//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Tom Bredemeier on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 15), count: 3),
                          spacing: 15, content: {
                            ForEach(0..<9, id: \.self) { index in
                                Color.blue
                                    .frame(width: 120, height: 120, alignment: .center)
                                    .cornerRadius(30)
                            }
                })
            }
            .navigationTitle("Tic Tac Toe")
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
