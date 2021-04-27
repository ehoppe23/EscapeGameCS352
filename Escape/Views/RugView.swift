//
// RugView.swift
// Escape
//
// A rug puzzle that requires items in inventory to solve
//
// @Author Emily Hoppe
// Last Updated: 4.16.21
//

import SwiftUI

struct RugView: View {
    @StateObject var rug: RugManager
    
    //Solving this puzzle provides an item to add to inventory
    @StateObject var stuff: Inventory
    
    var body: some View {
        VStack {
            if !rug.burned {
                //Basic rug image
                Image("Rug").resizable()
            } else {
                //Once the rug is burned (requires match and gas being used)
                //The image becomes the floor covered in ash
                ZStack{
                    Image("Ash").resizable()
                    
                    //The rug was 'covering' a key, once the key button has been pressed
                    //The key is added to inventory and is no longer on the ground
                    if !stuff.hasKey() && !stuff.hadKey {
                        Button(action:{
                            stuff.aquireKey()
                            rug.solved = true
                        }, label:{
                            Image("Key").resizable().frame(width: 30, height: 30)
                        })
                    }
                }
            }
        }
        
    }
}

//Preview of UI
struct RugView_Preview: PreviewProvider {
    
    static var previews: some View {
        RugView(rug: RugManager(), stuff: Inventory())
    }
}
