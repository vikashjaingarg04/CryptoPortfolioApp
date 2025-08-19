import SwiftUI
import Charts

struct PortfolioChartPoint: Identifiable { let id = UUID(); let index: Int; let value: Double }

struct PortfolioChartView: View {
	let values: [Double]
	@State private var selectedIndex: Int? = nil
	
	var points: [PortfolioChartPoint] { values.enumerated().map { .init(index: $0.offset, value: $0.element) } }
	
	var body: some View {
		Chart {
			ForEach(points) { point in
				BarMark(x: .value("Index", point.index), y: .value("Value", point.value))
					.opacity(0.35)
				LineMark(x: .value("Index", point.index), y: .value("Value", point.value))
					.interpolationMethod(.catmullRom)
			}
			if let idx = selectedIndex, idx < points.count {
				let p = points[idx]
				RuleMark(x: .value("Index", p.index))
					.lineStyle(StrokeStyle(lineWidth: 1.5))
					.foregroundStyle(.white)
				PointMark(x: .value("Index", p.index), y: .value("Value", p.value))
					.symbolSize(80)
			}
		}
		.chartYAxis(.hidden)
		.chartXAxis(.hidden)
		.frame(height: 220)
		.contentShape(Rectangle())
		.gesture(DragGesture(minimumDistance: 0).onChanged { value in
			let width = value.startLocation.x
			if width > 0 {
				let idx = Int((width / max(1, UIScreen.main.bounds.width)) * CGFloat(values.count))
				selectedIndex = min(max(0, idx), values.count - 1)
			}
		}.onEnded { _ in
			withAnimation(.easeOut) { selectedIndex = nil }
		})
	}
} 