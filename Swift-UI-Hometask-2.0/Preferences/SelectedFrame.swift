//
//  SelectedFrame.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 13.06.2022.
//

import SwiftUI

struct SelectedFrame: View {
     let anchor: Anchor<CGRect>?


     var body: some View {
         GeometryReader { proxy in
             if let rect = self.anchor.map( { proxy[$0] }) {
                 Rectangle()
                     .fill(Color.clear)
                     .border(Color.red, width: 2)
                     .offset(x: rect.minX, y: rect.minY)
                     .frame(width: rect.width, height: rect.height)
             }
         }
     }

 }
