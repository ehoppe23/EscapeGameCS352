//
// RugManager.swift
// Escape
//
// Manages the state of the rug
// While technically a puzzle, the rug had enough layers to its
// user interaction that it required its own class
//
// @Author Emily Hoppe
// Last Updated: 4.22.21
//

import Foundation

class RugManager: ObservableObject{
    @Published var gassy: Bool
    @Published var burned: Bool
    @Published var solved: Bool

    init(){
        gassy = false
        burned = false
        solved = false
    }

    //Rug becomes gassy after the gasoline tank
    //is used on it
    func nowGassy(){
        gassy = true
    }
    
    //Rug becomes burned after the match is used on it
    //This can only happen if the rug is already "gassy"
    func nowBurned(){
        burned = true
    }

}
