import Foundation

final class TransactionsViewModel: ObservableObject {
	@Published var transactions: [Transaction] = MockData.transactions
	@Published var portfolioINR: Double = 157342.05
	@Published var portfolioDeltaINR: Double = 1342
	@Published var deltaPercent: Double = 4.6
} 