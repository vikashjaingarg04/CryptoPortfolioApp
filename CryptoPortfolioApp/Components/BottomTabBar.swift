import SwiftUI

struct BottomTabBar: View {
	@Binding var selected: RootTab
	var plusTapped: () -> Void
	
	var body: some View {
		HStack(spacing: 16) {
			ForEach(RootTab.allCases, id: \.self) { tab in
				TabItem(tab: tab, selected: $selected)
			}
			Button(action: plusTapped) {
				Image(systemName: "plus")
					.font(.title3.weight(.bold))
					.frame(width: 56, height: 56)
					.background(Circle().fill(.ultraThinMaterial))
			}
		}
		.padding(.horizontal, 20)
		.padding(.vertical, 10)
		.background(.ultraThinMaterial, in: Capsule())
		.shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 8)
		.padding(.bottom, 12)
	}
}

private struct TabItem: View {
	let tab: RootTab
	@Binding var selected: RootTab
	
	var isSelected: Bool { selected == tab }
	
	var body: some View {
		Button {
			withAnimation(.spring()) { selected = tab }
			Haptics.tap()
		} label: {
			VStack(spacing: 6) {
				Image(systemName: tab.systemImage)
					.symbolVariant(isSelected ? .fill : .none)
					.font(.system(size: 18, weight: .semibold))
				Text(tab.title)
					.font(.footnote)
			}
			.padding(.vertical, 10)
			.frame(maxWidth: .infinity)
			.foregroundStyle(isSelected ? Color.white : Color.secondary)
			.background(
				ZStack {
					if isSelected {
						Capsule().fill(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
					}
				}
			)
		}
	}
}

enum Haptics {
	static func tap() { #if os(iOS)
		UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
	#endif }
} 