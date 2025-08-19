import SwiftUI

struct TransactionsSummaryView: View {
	@EnvironmentObject private var vm: TransactionsViewModel
	var body: some View {
		ScrollView {
			VStack(spacing: 20) {
				PortfolioCard(value: vm.portfolioINR, deltaAmount: vm.portfolioDeltaINR, deltaPercent: vm.deltaPercent)
				ActionButtonsRow()
				
				HStack {
					Text("Transactions")
						.font(.title3.bold())
					Spacer()
					Text("Last 4 days").foregroundStyle(.secondary)
				}
				
				ForEach(MockData.transactions) { tx in
					TransactionRowView(tx: tx)
				}
			}
			.padding()
		}
		.navigationTitle("")
	}
}

private struct PortfolioCard: View {
	let value: Double
	let deltaAmount: Double
	let deltaPercent: Double
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("INR")
				.font(.caption.weight(.semibold))
				.padding(.horizontal, 10)
				.padding(.vertical, 6)
				.background(Color.black.opacity(0.25), in: Capsule())
			Text(Formatters.inr(from: value))
				.font(.system(size: 44, weight: .bold, design: .rounded))
			HStack(spacing: 8) {
				Text(Formatters.inr(from: deltaAmount))
					.foregroundStyle(.secondary)
				Text(String(format: "+%.1f%%", deltaPercent))
					.foregroundStyle(.green)
			}
		}
		.padding()
		.background(
			ZStack(alignment: .bottom) {
				RoundedRectangle(cornerRadius: 24).fill(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
				RoundedRectangle(cornerRadius: 24).strokeBorder(Color.black.opacity(0.2))
				RoundedRectangle(cornerRadius: 24).fill(Color.black.opacity(0.15)).frame(height: 10).offset(y: 18)
			}
		)
	}
}

private struct ActionButtonsRow: View {
	var body: some View {
		HStack(spacing: 26) {
			CircleButton(title: "Send", system: "arrow.up")
			CircleButton(title: "+", system: "plus")
			CircleButton(title: "Down", system: "arrow.down")
		}
	}
}

private struct CircleButton: View {
	let title: String
	let system: String
	var body: some View {
		VStack(spacing: 10) {
			Image(systemName: system)
				.font(.title3)
				.frame(width: 60, height: 60)
				.background(.ultraThinMaterial, in: Circle())
			Text(title).font(.subheadline)
		}
	}
} 