import Foundation
import SwiftUI

enum MockData {
	static let assets: [Asset] = [
		Asset(symbol: "BTC", name: "Bitcoin", priceINR: 7562502.14, changePercent: 3.2, icon: "bitcoinsign.circle.fill", balance: 0.015),
		Asset(symbol: "ETH", name: "Ether", priceINR: 179102.50, changePercent: 3.6, icon: "e.circle.fill", balance: 2.64)
	]
	
	static let transactions: [Transaction] = [
		Transaction(title: "Receive", date: Date().addingTimeInterval(-4*24*3600), tokenSymbol: "BTC", amount: 0.002126, direction: .receive),
		Transaction(title: "Sent", date: Date().addingTimeInterval(-5*24*3600), tokenSymbol: "ETH", amount: 0.003126, direction: .sent),
		Transaction(title: "Send", date: Date().addingTimeInterval(-6*24*3600), tokenSymbol: "LTC", amount: 0.02126, direction: .sent)
	]
	
	static let rateETHINR = ExchangeRate(fromSymbol: "ETH", toSymbol: "INR", rate: 176138.80, spreadPercent: 0.2, gasFeeINR: 422.73)
	
	static func portfolioSeries(days: Int = 30) -> [Double] {
		let base: Double = 1423400
		return (0..<days).map { idx in
			let noise = Double.random(in: -0.06...0.06)
			return base * (1.0 + noise) * (1 + 0.002 * Double(idx))
		}
	}
} 