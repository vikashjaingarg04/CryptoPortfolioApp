import SwiftUI

struct ExchangeView: View {
	@EnvironmentObject private var vm: ExchangeViewModel
	
	var body: some View {
		ScrollView {
			VStack(spacing: 22) {
				HStack {
					Button(action: {}) { Image(systemName: "chevron.left") }
					Text("Exchange").font(.title3.bold())
					Spacer()
				}
				SwapCard()
				Button(action: { Haptics.tap() }) {
					Text("Exchange").frame(maxWidth: .infinity)
				}
				.buttonStyle(.borderedProminent)
				.clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
				.padding(.top, 6)
				
				SummaryView()
			}
			.padding()
		}
	}
}

private struct SwapCard: View {
	@EnvironmentObject private var vm: ExchangeViewModel
	
	var body: some View {
		VStack(spacing: 0) {
			SwapRow(top: true)
			Divider().background(Color.white.opacity(0.1))
			SwapRow(top: false)
		}
		.background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 22, style: .continuous))
	}
}

private struct SwapRow: View {
	@EnvironmentObject private var vm: ExchangeViewModel
	let top: Bool
	
	var body: some View {
		HStack(alignment: .center, spacing: 12) {
			Image(systemName: top ? "e.circle.fill" : "indianrupeesign.circle")
				.font(.system(size: 28))
			VStack(alignment: .leading, spacing: 6) {
				HStack {
					Text(top ? vm.fromSymbol : vm.toSymbol)
						.font(.headline)
					Image(systemName: "chevron.down").font(.caption)
					Spacer()
					Text(top ? "Send" : "Receive").foregroundStyle(.secondary)
				}
				if top {
					TextField("0.0", text: $vm.fromAmount)
						.font(.system(size: 34, weight: .bold))
						.keyboardType(.decimalPad)
						.onChange(of: vm.fromAmount) { _ in vm.recalc() }
					Text("Balance 10.254").foregroundStyle(.secondary).font(.subheadline)
				} else {
					Text(Formatters.inr(from: vm.toAmountINR))
						.font(.system(size: 34, weight: .bold))
					Text("Balance 4,35,804").foregroundStyle(.secondary).font(.subheadline)
				}
			}
		}
		.padding()
	}
}

private struct SummaryView: View {
	@EnvironmentObject private var vm: ExchangeViewModel
	var body: some View {
		VStack(spacing: 12) {
			HStack { Text("Rate"); Spacer(); Text("1 ETH = \(Formatters.inr(from: vm.rate.rate))") }
			HStack { Text("Spread"); Spacer(); Text(String(format: "%.1f%%", vm.rate.spreadPercent)) }
			HStack { Text("Gas fee"); Spacer(); Text(Formatters.inr(from: vm.rate.gasFeeINR)) }
			Divider()
			HStack { Text("You will receive"); Spacer(); Text(Formatters.inr(from: vm.toAmountINR)).fontWeight(.bold) }
		}
		.font(.subheadline)
		.foregroundStyle(.secondary)
	}
} 