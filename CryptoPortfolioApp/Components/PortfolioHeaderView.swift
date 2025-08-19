import SwiftUI

struct PortfolioHeaderView: View {
	@EnvironmentObject private var vm: PortfolioViewModel
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			HStack {
				Text("Portfolio Value ▸")
					.font(.subheadline)
					.foregroundStyle(.secondary)
				Spacer()
				ToggleUnit(selected: $vm.selectedUnit)
			}
			Text(valueText)
				.font(.system(size: 38, weight: .bold, design: .rounded))
		}
		.padding()
		.background(
			LinearGradient(colors: [Color(.sRGB, red: 0.18, green: 0.19, blue: 0.36, opacity: 1),
									 Color(.sRGB, red: 0.38, green: 0.24, blue: 0.75, opacity: 1)],
						 startPoint: .topLeading, endPoint: .bottomTrailing)
		)
		.clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
	}
	
	private var valueText: String {
		switch vm.selectedUnit {
		case .inr: return Formatters.inr(from: vm.portfolioValueINR)
		case .btc: return String(format: "%.3f BTC", vm.portfolioValueBTC)
		}
	}
}

struct ToggleUnit: View {
	@Binding var selected: PortfolioUnit
	var body: some View {
		HStack(spacing: 6) {
			TogglePill(title: "₹", isOn: selected == .inr) {
				selected = .inr
			}
			TogglePill(title: "₿", isOn: selected == .btc) {
				selected = .btc
			}
		}
		.padding(6)
		.background(.ultraThinMaterial, in: Capsule())
	}
}

private struct TogglePill: View {
	let title: String
	let isOn: Bool
	let action: () -> Void
	var body: some View {
		Button(action: action) {
			Text(title).font(.subheadline.bold())
				.padding(.horizontal, 10).padding(.vertical, 6)
				.background(isOn ? Color.black.opacity(0.35) : .clear, in: Capsule())
				.foregroundStyle(.white)
		}
	}
} 