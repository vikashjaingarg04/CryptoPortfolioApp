import SwiftUI

struct AssetCardView: View {
	let asset: Asset
	var body: some View {
		HStack(spacing: 14) {
			Image(systemName: asset.icon)
				.font(.system(size: 26))
				.foregroundStyle(.orange)
				.frame(width: 44, height: 44)
				.background(Color.black.opacity(0.2), in: Circle())
			VStack(alignment: .leading, spacing: 6) {
				Text("\(asset.name) (\(asset.symbol))")
					.font(.subheadline.weight(.semibold))
				Text(asset.formattedPrice)
					.font(.headline)
			}
			Spacer()
			Text(String(format: "%+.1f%%", asset.changePercent))
				.font(.subheadline.weight(.semibold))
				.foregroundStyle(asset.changeColor)
		}
		.padding()
		.background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
	}
} 