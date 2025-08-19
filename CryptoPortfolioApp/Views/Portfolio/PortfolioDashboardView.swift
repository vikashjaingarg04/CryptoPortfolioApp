import SwiftUI

struct PortfolioDashboardView: View {
	@EnvironmentObject private var vm: PortfolioViewModel
	
	var body: some View {
		ScrollView {
			VStack(spacing: 20) {
				PortfolioHeaderView()
					.environmentObject(vm)
				TimeSelectorView(selected: $vm.selectedRange)
				PortfolioChartView(values: vm.series)
				
				HStack {
					Text("Assets")
						.font(.title3.bold())
					Spacer()
				}
				ForEach(vm.assets) { asset in
					AssetCardView(asset: asset)
				}
				
				VStack(alignment: .leading, spacing: 12) {
					Text("Recent Transactions")
						.font(.title3.bold())
					ForEach(vm.transactions) { tx in
						TransactionRowView(tx: tx)
					}
				}
			}
			.padding()
		}
		.navigationTitle("")
		.navigationBarTitleDisplayMode(.inline)
	}
} 