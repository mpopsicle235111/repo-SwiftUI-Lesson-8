//
//  HeightSelector.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 13.06.2022.
//

import Foundation
import SwiftUI

struct HeightSelector: PreferenceKey {
     static var defaultValue: CGFloat = 0

     static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
         value = max(value, nextValue())
     }
 }
