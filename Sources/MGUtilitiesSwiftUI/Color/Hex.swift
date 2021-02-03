//
//  Hex.swift
//
//
//  Created by Melvin Gundlach on 06.10.19.
//

import SwiftUI

extension Color {
	public init?(hex: String) {
		let r, g, b, a: Double
		
		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			let hexColor = String(hex[start...])
			
			if hexColor.count == 8 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = Double((hexNumber & 0xff000000) >> 24) / 255
					g = Double((hexNumber & 0x00ff0000) >> 16) / 255
					b = Double((hexNumber & 0x0000ff00) >> 8) / 255
					a = Double(hexNumber & 0x000000ff) / 255
					
					self.init(red: r, green: g, blue: b, opacity: a)
					return
				}
			} else if hexColor.count == 6 {
				let scanner = Scanner(string: hexColor)
				var hexNumber: UInt64 = 0
				
				if scanner.scanHexInt64(&hexNumber) {
					r = Double((hexNumber & 0xff0000) >> 16) / 255
					g = Double((hexNumber & 0x00ff00) >> 8) / 255
					b = Double(hexNumber & 0x0000ff) / 255
					
					self.init(red: r, green: g, blue: b)
					return
				}
			}
		}
		
		return nil
	}
}
