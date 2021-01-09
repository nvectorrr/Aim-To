//
//  Launch Screen.swift
//  Aim To
//
//  Created by Виктор  Найденович  on 09.01.2021.
//

import SwiftUI

struct Launch_Screen: View {
    
    @State private var willMoveToNextScreen = false

    var body: some View {
        VStack{
            Group{
                VStack{
                    Text("Aim To")
                        .font(.title)
                    Text("Please wait for load")
                        .font(.subheadline)
                }
                Button(action: {
                    willMoveToNextScreen = true
                }, label: {
                    Text("Continue")
                })
            }.frame(maxHeight: .infinity, alignment: .bottom)
        }.navigate(to: MainView(), when: $willMoveToNextScreen)
    }
}

/// Navigate to a new view.
/// - Parameters:
///   - view: View to navigate to.
///   - binding: Only navigates when this condition is `true`.
extension View {
    
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}

struct Launch_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Launch_Screen()
    }
}

// lol its fucking useless, need to implement it using info.plist
