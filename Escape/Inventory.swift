//
// Inventory.swift
// Escape
//
// Displays the player inventory and allows object use
//
// @Author Emily Hoppe
// Last Updated: 4.19.21
//

import Foundation


class Inventory: ObservableObject{
    //Current objects in inventory
    @Published var key: Bool
    @Published var gasoline: Bool
    @Published var match: Bool
    
    //Previous object in inventory
    //(Can't pick up an object more than once)
    @Published var hadKey: Bool
    @Published var hadGasoline: Bool
    @Published var hadMatch: Bool
    
    //Currect location
    //Allows for object use
    @Published var atRug: Bool
    @Published var atCloset: Bool

    init(){
        key = false
        gasoline = false
        match = false
        hadKey = false
        hadGasoline = false
        hadMatch = false
        atRug = false
        atCloset = false
    }

    // Key management //
    func aquireKey(){
        key = true
    }
    func hasKey() -> Bool{
        return key
    }
    func loseKey(){
        key = false
        hadKey = true
    }

    // Gas management //
    func aquireGas(){
        gasoline = true
    }
    func hasGas() -> Bool{
        return gasoline
    }
    func loseGas(){
        gasoline = false
        hadGasoline = true
    }

    // Match management //
    func aquireMatch(){
        match = true
    }
    func hasMatch() -> Bool{
        return match
    }
    func loseMatch(){
        match = false
        hadMatch = true
    }
}
