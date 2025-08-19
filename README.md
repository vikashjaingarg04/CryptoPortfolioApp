# CryptoPortfolioApp

A SwiftUI iOS app that recreates the provided crypto portfolio and exchange UI. Uses mock data, MVVM, custom bottom tab bar with optional glass effect, and SwiftUI Charts for graphs.

## Requirements
- Xcode 15+
- iOS 16+ target (uses SwiftUI Charts and .ultraThinMaterial)

## Setup
1. In Xcode, create a new iOS App named `CryptoPortfolioApp` with Interface: SwiftUI, Language: Swift, Lifecycle: SwiftUI App, iOS 16+.
2. Quit Xcode.
3. Copy the `CryptoPortfolioApp` folder from this repository into your project directory so that the structure matches:
   - `<repo>/CryptoPortfolioApp/` containing all `.swift` files
   - Make sure Xcode references point to files on disk (not to a different folder).
4. Re-open the project in Xcode and ensure the new files are added to the app target (select files in the Project Navigator → Target Membership → check your app target).

## Run
- Build and run on iPhone 13/14/15 simulators.
- Dark Mode is the default. Light Mode also supported where noted.

## Screens
- Portfolio Dashboard: portfolio header with INR/crypto toggle, time selector, combo bar+line chart, asset cards for BTC/ETH, recent transactions list.
- Transactions Summary: large portfolio card, action buttons (send/receive/exchange), transactions list.
- Exchange: swap UI (ETH↔INR), amount entry with dynamic conversion, summary (rate, spread, gas), Exchange button.
- Bottom Navigation: 4 tabs (Analytics, Exchange, Record, Wallet) with glassmorphism background and highlighted selection.

## Notes
- All data is mocked in `MockData` and view models (`PortfolioViewModel`, `TransactionsViewModel`, `ExchangeViewModel`).
- Haptics included for primary actions (where available).
- Minor animations for chart value changes and tab transitions.

## File Map (key items)
- `CryptoPortfolioAppApp.swift` – App entry
- `ContentView.swift` – Tab container with custom bottom bar
- `Views/Portfolio/PortfolioDashboardView.swift`
- `Views/Transactions/TransactionsSummaryView.swift`
- `Views/Exchange/ExchangeView.swift`
- `Components/*` – Reusable UI pieces (header, chart, cards, buttons, tab bar)
- `Models/*`, `ViewModels/*`, `Utils/*`

## Credits
- Icons: SF Symbols
- Charts: SwiftUI Charts

## License
MIT 