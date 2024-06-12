 //
//  String+Extension.swift
//  GildedRoseDemo
//
//  Created by Michelle Ybanez on 6/12/24.
//

import Foundation

extension String {
    
    /// Converts string to zero and falls back to zero if not possible
    var toIntOrZero: Int {
        Int(self) ?? 0
    }
}
