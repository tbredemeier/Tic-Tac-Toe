//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Tom Bredemeier on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var moves = Array(repeating: "", count: 9)
    @State var xTurn = true
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 15), count: 3),
                          spacing: 15, content: {
                            ForEach(0..<9, id: \.self) { index in
                                ZStack {
                                    Color.blue
                                    Color.white
                                        .opacity(moves[index] == "" ? 1 : 0)
                                    Text(moves[index])
                                        .font(.system(size: 90))
                                        .fontWeight(.heavy)
                                }
                                .frame(width: 120, height: 120, alignment: .center)
                                .cornerRadius(30)
                                .onTapGesture {
                                    withAnimation(Animation.default) {
                                        if moves[index] == "" {
                                            moves[index] = xTurn ? "X" : "O"
                                            xTurn.toggle()
                                        }
                                    }
                                }
                                .rotation3DEffect(
                                    .init(degrees: moves[index] != "" ? 180 : 0),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
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
