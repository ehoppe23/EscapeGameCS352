//
//  Puzzle.swift
//  Escape Game
//
// @Author Emily Hoppe
// Last Updated: 4.12.21
//

import Foundation


// "Abstract" parent puzzle class
class Puzzle: ObservableObject{
    @Published var solved: Bool

    init(){
        solved = false
    }

    func draw() {}

    func solve() {
        solved = true;
    }

    func isComplete() -> Bool {
        return solved
    }
}

// Main puzzle - the door
class X: Puzzle {
    var answer: Int

    init(answer: Int){
        self.answer = answer
        super.init()
    }

    func solve(attempt: Int){
        if attempt == self.answer {
            super.solve()
        }
    }

    override func draw(){
            //Fill later//
    }

    func drawOpen(){
            //Fill later//
    }
}

//Closet puzzle
class A: Puzzle {
    override func draw(){
            //Fill later//
    }

    func drawOpen(){
            //Fill later//
    }
}

// Painting
// More hint than puzzle, is solved when safe is solved
class B: Puzzle{
    override func draw(){
            //Fill later//
            //If safe complete add "nothing more here" message
    }
}

// Table puzzle
// Turning dials
// Dials must be labelled a,b,c,d for puzzle to work
class C: Puzzle{
    @Published var dial1: Int
    @Published var dial2: Int
    @Published var dial3: Int
    @Published var dial4: Int
    @Published var dials: [Int] = []

    override init(){
        dial1 = 0
        dial2 = 0
        dial3 = 0
        dial4 = 0
        super.init()
        dials = [dial1, dial2, dial3, dial4]
    }

    override func solve(){
        if dial1 == 0 && dial2 == 3 && dial3 == 1 && dial4 == 3 {
            super.solve()
        }
    }

    func turnDial(choice: Int){
        dials[choice] += 1
        if dials[choice] > 3 {dials [choice] = 0}
    }

    override func draw(){
            //Fill later//
    }

    func drawComplete(){
            //Fill later//
    }

    func drawDials(){
            //Fill later//
    }
}

// Rug puzzle
// Requires object interaction
class D: Puzzle{
    @Published var gassy: Bool

    override init(){
        gassy = false
        super.init()
    }

    func isGassy() -> Bool {
        return gassy
    }
    func nowGassy(){
        gassy = true
    }

    override func draw(){
            //Fill later//
    }

    func drawFire(){
            //Fill later//
    }

    func drawBurned(){
            //Fill later//
            //Include w/ w/o key//
    }
}

// Safe puzzle
class E: Puzzle{
    var answer: String

    init(answer: String){
        self.answer = answer
        super.init()
    }

    func solve(attempt: String){
        if attempt == answer {super.solve()}
    }

    override func draw(){
            //Fill later//
    }

    func drawOpen(){
            //Fill later//
    }
}

// Desk puzzle
// Involves connected switches
class F: Puzzle{
    @Published var switch1: Bool
    @Published var switch2: Bool
    @Published var switch3: Bool
    @Published var switch4: Bool
    @Published var switches: [Bool] = []

    override init(){
        switch1 = false
        switch2 = false
        switch3 = false
        switch4 = false
        super.init()
        switches = [switch1, switch2, switch3, switch4]
    }

    override func solve(){
        var test = true
        for s in switches{
            if !s {test = false}
        }
        if test {super.solve()}
    }

    func flip(choice: Int){
        switch choice{
        case 0:
            switch1 = !switch1
            switch2 = !switch2
            switch3 = !switch3
        case 1:
            switch2 = !switch2
            switch1 = !switch1
        case 2:
            switch3 = !switch3
            switch2 = !switch2
            switch4 = !switch4
        case 3:
            switch4 = !switch4
            switch3 = !switch3
        default:
            return;
        }
    }

    override func draw(){
            //Fill later//
    }

    func drawFinished(){
            //Fill later//
    }

    func drawSwitches(){
            //Fill later//
    }
}

// Trash Bin
// More hint than puzzle, is solved when table is solved
class G: Puzzle{
    override func draw(){
            //Fill later//
    }

    func drawNote(){
            //Fill later//
    }
}

// Inventory
// Displays the player inventory and allows object use
class Inventory: ObservableObject{
    @Published var key: Bool
    @Published var gasoline: Bool
    @Published var match: Bool

    init(){
        key = false
        gasoline = false
        match = false
    }

    //Key management
    func aquireKey(){
        key = true
    }
    func hasKey() -> Bool{
        return key
    }
    func loseKey(){
        key = false
    }

    //Gas management
    func aquireGas(){
        gasoline = true
    }
    func hasGas() -> Bool{
        return gasoline
    }
    func loseGas(){
        gasoline = false
    }

    //Match management
    func aquireMatch(){
        match = true
    }
    func hasMatch() -> Bool{
        return match
    }
    func loseMatch(){
        match = false
    }

    func draw(){
        //Fill later//
    }
}
