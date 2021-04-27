//
// ExitButtonView.swift
// Escape
//
// Exit button for every area of the room that the user can go
// Brings the user back to the full room
//
//@Author Emily Hoppe
// Last Updated: 4.22.21
//

import SwiftUI

struct ExitButtonView: View {
    @StateObject var inventory: Inventory
    @StateObject var nav: Navigator
    
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Button(action:{
                        //Set navigator to full room
                        nav.choice = "Q"
                        //Resets the inventory's location sense
                        inventory.atCloset = false
                        inventory.atRug = false
                    }, label:{
                        Image("ExitButton").resizable().frame(width: 20.0, height: 20.0)
                    })
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

//Preview of UI
struct ExitButtonView_Preview: PreviewProvider {
    
    static var previews: some View {
        ExitButtonView(inventory: Inventory(), nav: Navigator())
    }
}
