import Foundation

extension OnboardPageView {
   // - Fixme: ⚠️️ add doc
   static let spacing: CGFloat = 12
   // - Fixme: ⚠️️ add doc
   static let horPadding: CGFloat = {
      #if os(iOS)
      return 8
      #elseif os(macOS)
      return 32
      #endif
   }()
   // - Fixme: ⚠️️ add doc
   static let maxWidth: CGFloat = 500
}
