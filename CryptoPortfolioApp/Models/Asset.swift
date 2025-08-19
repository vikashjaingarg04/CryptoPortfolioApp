import Foundation
import SwiftUI

struct Asset: Identifiable, Hashable {
	let id = UUID()
	let symbol: String
	let name: String
	let priceINR: Double
	let changePercent: Double
	let icon: String
	let balance: Double
}

extension Asset {
	var formattedPrice: String { Formatters.inr(from: priceINR) }
	var changeColor: Color { changePercent >= 0 ? .green : .red }
} 