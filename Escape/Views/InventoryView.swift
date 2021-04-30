//
// Inventory View.swift
// Escape
//
// Displays the items the user has collected
// Present at all times on screen until the game is solved
//
// @Author Emily Hoppe
// Last Updated: 4.16.21
//

import SwiftUI

struct InventoryView: View {
    @StateObject var inventory: Inventory
    
    //Rug and closet objects are the only puzzles that require an inventory item to solve
    @StateObject var rug: RugManager
    @StateObject var closet: Puzzle
    
    var body: some View {
        ZStack { //Backdrop is green inventory display
            VStack {
                Spacer()
                Image("Inventory").resizable()
                    .frame(width: 380.0, height: 89.0)
            }
            VStack { //Items that the user currently has are aligned in a row
                Spacer()
                HStack{
                    //Gas and match items may or may not be owned at the same time
                    if(inventory.hasGas()){
                        if(inventory.hasMatch()){
                            Spacer()}
                        Button(action:{
                            if(inventory.atRug){
                                rug.nowGassy()
                                inventory.loseGas()
                            }
                        }, label:{
                            Image("Gas").resizable().frame(width: 60.0, height: 60.0)
                        })}
                    
                    if(inventory.hasMatch()){
                        Spacer()
                        Button(action:{
                            if(inventory.atRug && rug.gassy){
                                rug.nowBurned()
                                inventory.loseMatch()
                            }
                        }, label:{
                            Image("Match").resizable().frame(width: 60.0, height: 60.0)
                        })
                        
                        Spacer()
                    }
                    //Key cannot be collected without first losing the gas and match
                    //So when the key is owned it is the only item in inventory
                    if(inventory.hasKey()){
                        Button(action:{
                            if(inventory.atCloset){
                                closet.openDoors()
                                inventory.loseKey()
                            }
                        }, label:{
                            Image("Key").resizable().frame(width: 60.0, height: 60.0)
                        })
                    }
                }
            }
        }
    }
}

//Preview of UI
struct Inventory_Preview: PreviewProvider {
    
    static var previews: some View {
        InventoryView(inventory: Inventory(), rug: RugManager(), closet: Puzzle())
    }
}
