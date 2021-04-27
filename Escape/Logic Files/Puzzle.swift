//
// Puzzle.swift
// Escape Game
//
// Provides the solvability to all puzzles in the game
// Manages puzzle answers and states
//
// @Author Emily Hoppe
// Last Updated: 4.24.21
//

import Foundation

class Puzzle: ObservableObject{
    //Generic variable for all Puzzles to indicate if it has been solved
    @Published var solved: Bool
    
    //Only used by closet Puzzle
    @Published var isOpen: Bool
    
    //If the Puzzle is not the safe, this will be left blank
    var safeAnswer: String
    //If the Puzzle is not the door, this will be left blank
    var doorAnswer: Int

    //Generic init
    init(){
        solved = false
        safeAnswer = ""
        doorAnswer = 0
        isOpen = false
    }
    
    //Init for safe puzzle
    init(safeAnswer: String){
        solved = false
        doorAnswer = 0
        isOpen = false
        self.safeAnswer = safeAnswer
    }
    
    //Init for door puzzle
    init(doorAnswer: Int){
        solved = false
        safeAnswer = ""
        isOpen = false
        self.doorAnswer = doorAnswer
    }
    
    //Generic solve for most puzzles
    func solve() {
        solved = true;
    }
    
    //Reserved for use with the desk, other Puzzle objects do not use this
    func solveDesk(s1: Bool, s2: Bool, s3: Bool, s4: Bool, s5: Bool, s6: Bool){
        //Tests to make sure all switches are flipped up
        if(s1 && s2 && s3 && s4 && s5 && s6) {solved = true}
    }
    
    //Reserved for use with the table, other Puzzle objects do not use this
    func solveTable(dial1: Int, dial2: Int, dial3: Int, dial4: Int){
        //Tests to make sure the dials are in the correct orientations
        if dial1 == 0 && dial2 == 3 && dial3 == 1 && dial4 == 3 {
            solved = true
        }
    }
    
    //Reserved for use with the safe, other Puzzle objects do not use this
    func solveSafe(attempt: String){
        if attempt == safeAnswer { solved = true }
    }
    
    //Reserved for use with the door, other Puzzle objects do not use this
    func solveDoor(attempt: Int){
        if attempt == self.doorAnswer { solved = true }
    }
    
    //Reserved for use with the closet, other Puzzle objects do not use this
    func openDoors(){
        isOpen = true
    }
}



