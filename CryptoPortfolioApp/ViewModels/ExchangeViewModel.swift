import Foundation
import SwiftUI

final class ExchangeViewModel: ObservableObject {
	@Published var fromSymbol: String = "ETH"
	@Published var toSymbol: String = "INR"
	@Published var fromAmount: String = "2.640"
	@Published var toAmountINR: Double = 465006.44
	
	@Published var rate: ExchangeRate = MockData.rateETHINR
	
	func recalc() {
		let amount = Double(fromAmount) ?? 0
		let gross = amount * rate.rate
		let spread = gross * (rate.spreadPercent / 100.0)
		let net = gross - spread - rate.gasFeeINR
		toAmountINR = max(net, 0)
	}
} 