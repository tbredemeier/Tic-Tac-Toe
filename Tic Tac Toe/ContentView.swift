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
    @State var gameOver = false
    @State var winMessage = ""
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
        .alert(isPresented: $gameOver, content: {
            Alert(title: Text(winMessage), dismissButton: .destructive(Text("Play Again"), action: {
                withAnimation(Animation.easeIn(duration: 0.5)) {
                    moves = Array(repeating: "", count: 9)
                    gameOver = false
                }
            }))
        })
        .onChange(of: moves, perform: { value in
            checkForWinner()
        })
    }
    
    private func checkForWinner() {
        checkLine(a: 0, b: 1, c: 2)
        checkLine(a: 3, b: 4, c: 5)
        checkLine(a: 6, b: 7, c: 8)
        checkLine(a: 0, b: 3, c: 6)
        checkLine(a: 1, b: 4, c: 7)
        checkLine(a: 2, b: 5, c: 8)
        checkLine(a: 0, b: 4, c: 8)
        checkLine(a: 6, b: 4, c: 2)
        if !moves.contains("") {
            winMessage = "Cat's Game"
            gameOver = true
        }
    }
    
    private func checkLine(a: Int, b: Int, c: Int) {
        if moves[a] != "" && moves[a] == moves[b] && moves[b] == moves[c] {
            winMessage = "\(moves[a]) is the winner!"
            gameOver = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
