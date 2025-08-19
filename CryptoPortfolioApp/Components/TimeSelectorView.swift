import SwiftUI

struct TimeSelectorView: View {
	@Binding var selected: TimeRange
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 14) {
				ForEach(TimeRange.allCases) { range in
					Button {
						withAnimation(.easeInOut) { selected = range }
					} label: {
						Text(range.rawValue)
							.font(.subheadline.weight(.semibold))
							.foregroundStyle(selected == range ? .white : .secondary)
							.padding(.vertical, 8)
							.frame(width: 36)
					}
				}
			}
			.padding(.horizontal)
		}
	}
} 