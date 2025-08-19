import Foundation

enum Formatters {
	static func inr(from value: Double) -> String {
		let fmt = NumberFormatter()
		fmt.numberStyle = .currency
		fmt.currencyCode = "INR"
		fmt.maximumFractionDigits = 2
		return fmt.string(from: NSNumber(value: value)) ?? "₹0.00"
	}
	
	static func tokenAmount(_ value: Double, symbol: String) -> String {
		String(format: "%.6f %@", value, symbol)
	}
	
	static func dayMonth(from date: Date) -> String {
		let df = DateFormatter()
		df.dateFormat = "d MMMM"
		return df.string(from: date)
	}
} 