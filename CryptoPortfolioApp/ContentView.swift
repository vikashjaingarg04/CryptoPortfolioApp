import SwiftUI

enum RootTab: Int, CaseIterable {
	case analytics
	case exchange
	case record
	case wallet
	
	var title: String {
		switch self {
		case .analytics: return "Analytics"
		case .exchange: return "Exchange"
		case .record: return "Record"
		case .wallet: return "Wallet"
		}
	}
	
	var systemImage: String {
		switch self {
		case .analytics: return "chart.line.uptrend.xyaxis"
		case .exchange: return "arrow.left.arrow.right"
		case .record: return "shippingbox"
		case .wallet: return "creditcard"
		}
	}
}

struct ContentView: View {
	@State private var selectedTab: RootTab = .analytics
	@State private var showActionSheet: Bool = false
	
	var body: some View {
		ZStack(alignment: .bottom) {
			Group {
				switch selectedTab {
				case .analytics:
					NavigationStack { PortfolioDashboardView() }
				case .exchange:
					NavigationStack { ExchangeView() }
				case .record:
					NavigationStack { TransactionsSummaryView() }
				case .wallet:
					NavigationStack { PortfolioDashboardView() }
				}
			}
			
			BottomTabBar(selected: $selectedTab, plusTapped: {
				withAnimation(.spring()) { showActionSheet.toggle() }
			})
		}
		.ignoresSafeArea(.keyboard)
		.sheet(isPresented: $showActionSheet) {
			ActionSheetView(isPresented: $showActionSheet)
		}
	}
}

struct ActionSheetView: View {
	@Binding var isPresented: Bool
	var body: some View {
		VStack(spacing: 16) {
			Capsule()
				.fill(.secondary)
				.frame(width: 48, height: 5)
				.padding(.top, 8)
			Text("Quick Actions")
				.font(.headline)
				.padding(.top, 8)
			HStack(spacing: 24) {
				QuickActionButton(title: "Send", system: "arrow.up.right")
				QuickActionButton(title: "Receive", system: "arrow.down.left")
				QuickActionButton(title: "+", system: "plus")
			}
			.padding(.vertical)
			Button("Close") { isPresented = false }
				.buttonStyle(.borderedProminent)
				.padding(.bottom, 24)
		}
		.padding()
	}
}

struct QuickActionButton: View {
	let title: String
	let system: String
	var body: some View {
		VStack {
			Image(systemName: system)
				.font(.title2)
				.frame(width: 56, height: 56)
				.background(.ultraThinMaterial, in: Circle())
			Text(title)
				.font(.footnote)
		}
	}
} 