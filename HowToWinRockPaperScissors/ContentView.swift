//
//  ContentView.swift
//  HowToWinRockPaperScissors
//
//  Created by Patryk Marciszewski on 16/10/2024.
//

import SwiftUI

struct ContentView: View {
    private var gameElements = ["rock", "paper", "scissors"]
    private let maxQuestions = 10
    @State private var randomNumber = Int.random(in: 0..<3)
    @State private var playerChoice = ""
    @State private var winorlose = Bool.random()
    @State private var currentQuestion: Int = 1
    
    @State private var userScore = 0
    @State private var answerCorrect = false
    @State private var gameOver = false
    @State private var presentAnswerAlert = false
    @State private var selectedSame = false
    
    private var rolesMap: [String: [Bool: String]] = [
        "rock": [true: "paper", false: "scissors"],
        "paper": [true: "scissors", false: "rock"],
        "scissors": [true: "rock", false: "paper"]
    ]
 
    var body: some View {
        VStack {
            VStack {
                Text("This is move: \(currentQuestion) / \(maxQuestions)")
                Text("Score: \(userScore)")
            }
            Spacer()
            Section {
                GameImage(name: gameElements[randomNumber])
            }
            Spacer()
            Section {
                VStack {
                    HStack {
                        Text("Select your move to:")
                        Text(" \(winorlose ? "WIN" : "LOSE")")
                            .font(.headline).foregroundStyle(winorlose ? Color.blue : Color.red)
                    }
                    HStack {
                        ForEach(gameElements, id: \.self) { element in
                            GameButton(name: element) {
                                checkAnswer(element)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .alert("Your answer is \(answerCorrect ? "correct" : "not correct")", isPresented: $presentAnswerAlert) {
            Button("Ok") {
                if currentQuestion == maxQuestions {
                    gameOver = true
                } else {
                    ask()
                }
            }
        }
        .alert("Game over", isPresented: $gameOver) {
            Button("Finish game") {
                userScore = 0
                currentQuestion = 1
            }
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert("You select same, lol...", isPresented: $selectedSame) {
            Button("OK") {
                ask(selectedSame: true)
            }
        }
    }
        
    func checkAnswer(_ playerAnswer: String) {
        if (playerAnswer == gameElements[randomNumber]) {
            selectedSame = true
            return
        }
        let role = rolesMap[gameElements[randomNumber]]!
        answerCorrect = role[winorlose]! == playerAnswer
        userScore = answerCorrect ? userScore + 1 : userScore - 1
        presentAnswerAlert = true
    }
    
    func ask(selectedSame: Bool = false) {
        if !selectedSame {
            currentQuestion += 1
            randomNumber = Int.random(in: 0..<3)
            winorlose = Bool.random()
        }
    }
}

#Preview {
    ContentView()
}
