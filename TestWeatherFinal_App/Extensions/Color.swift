//
//  Color.swift
//  TestAppWeather_FAU
//
//  Created by Андрей Федоров on 25.04.2023.
//

import Foundation
import SwiftUI

extension Color{
    static let custom = CustomColor()
}

struct CustomColor{
    var backgroundColor = Color("BackGroundColor")
    var tabBarColor = Color("TabBarColor")
    
}
