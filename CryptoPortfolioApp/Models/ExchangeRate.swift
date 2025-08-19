import Foundation

struct ExchangeRate: Hashable {
	let fromSymbol: String
	let toSymbol: String
	let rate: Double
	let spreadPercent: Double
	let gasFeeINR: Double
} 