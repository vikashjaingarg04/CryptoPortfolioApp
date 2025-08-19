import Foundation

enum TransactionDirection: String, Codable { case sent, receive }

struct Transaction: Identifiable, Hashable, Codable {
	let id: UUID
	let title: String
	let date: Date
	let tokenSymbol: String
	let amount: Double
	let direction: TransactionDirection
	
	init(id: UUID = UUID(), title: String, date: Date, tokenSymbol: String, amount: Double, direction: TransactionDirection) {
		self.id = id
		self.title = title
		self.date = date
		self.tokenSymbol = tokenSymbol
		self.amount = amount
		self.direction = direction
	}
}

extension Transaction {
	var formattedDate: String { Formatters.dayMonth(from: date) }
	var isInbound: Bool { direction == .receive }
} 