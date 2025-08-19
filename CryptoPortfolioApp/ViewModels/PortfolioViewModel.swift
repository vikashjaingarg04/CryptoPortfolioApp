import Foundation
import SwiftUI

enum TimeRange: String, CaseIterable, Identifiable {
	case h1 = "1h", h8 = "8h", d1 = "1d", w1 = "1w", m1 = "1m", m6 = "6m", y1 = "1y"
	var id: String { rawValue }
}

enum PortfolioUnit: String, CaseIterable { case inr, btc }

final class PortfolioViewModel: ObservableObject {
	@Published var selectedUnit: PortfolioUnit = .inr
	@Published var selectedRange: TimeRange = .m6
	@Published var series: [Double] = MockData.portfolioSeries(days: 20)
	@Published var assets: [Asset] = MockData.assets
	@Published var transactions: [Transaction] = MockData.transactions
	
	var portfolioValueINR: Double { 157342.05 }
	var portfolioValueBTC: Double { 0.015 }
} 