//
//  SelectedItemKey.swift
//  Swift-UI-Hometask-2.0
//
//  Created by Anton Lebedev on 13.06.2022.
//

import Foundation
import SwiftUI

struct SelectedItemKey: PreferenceKey {

     static var defaultValue: Anchor<CGRect>? = nil

     static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
         value = value ?? nextValue()
     }
 }
