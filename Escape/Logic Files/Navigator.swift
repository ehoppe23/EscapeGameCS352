//
// Navigator.swift
// Escape
//
// Manages where the user has selected to "go" within the room
// Primarily supports RoomView.Swift
//
// @Author Emily Hoppe
// Last Updated: 4.17.21
//

import Foundation


//Navigator class
class Navigator: ObservableObject{
    //All navigation options
    @Published var choices: [String]
    //Current navigation choice
    @Published var choice: String
    
    init(){
        choice = "Q"
        choices = ["A","B","C","D","E","F","G","X","Q"]
        //Letters represent arbitrary organization from previous ascii version of game
        //The choice is arbitrary, but it was easier to translate without changing them
        //Order is as follows:
        //A - Closet, B - Painting, C - Table, D - Rug, E - Safe, F - Desk, G - Trash,
        //X - Door (Exit), Q - Main Room
    }
}
