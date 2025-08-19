import SwiftUI

struct TransactionRowView: View {
	let tx: Transaction
	var body: some View {
		HStack(spacing: 14) {
			Image(systemName: tx.isInbound ? "arrow.down" : "arrow.up")
				.font(.headline)
				.frame(width: 44, height: 44)
				.background(Color(.tertiarySystemFill), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
			VStack(alignment: .leading, spacing: 4) {
				Text(tx.title)
					.font(.headline)
				Text(tx.formattedDate)
					.font(.subheadline)
					.foregroundStyle(.secondary)
			}
			Spacer()
			VStack(alignment: .trailing, spacing: 4) {
				Text(tx.tokenSymbol)
					.font(.subheadline)
				Text(String(format: "%+0.6f", tx.amount))
					.font(.headline)
			}
		}
		.padding()
		.background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
	}
} 