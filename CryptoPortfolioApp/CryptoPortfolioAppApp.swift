import SwiftUI

@main
struct CryptoPortfolioAppApp: App {
	@StateObject private var portfolioViewModel = PortfolioViewModel()
	@StateObject private var transactionsViewModel = TransactionsViewModel()
	@StateObject private var exchangeViewModel = ExchangeViewModel()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(portfolioViewModel)
				.environmentObject(transactionsViewModel)
				.environmentObject(exchangeViewModel)
		}
	}
} 