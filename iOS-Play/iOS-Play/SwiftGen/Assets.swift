// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let app = ImageAsset(name: "app")
  internal static let apptapped = ImageAsset(name: "apptapped")
  internal static let back = ImageAsset(name: "back")
  internal static let book = ImageAsset(name: "book")
  internal static let booktapped = ImageAsset(name: "booktapped")
  internal static let googlePlay = ImageAsset(name: "googlePlay")
  internal static let ios = ImageAsset(name: "iOS")
  internal static let movie = ImageAsset(name: "movie")
  internal static let movietapped = ImageAsset(name: "movietapped")
  internal static let music = ImageAsset(name: "music")
  internal static let musictapped = ImageAsset(name: "musictapped")
  internal static let tvShow = ImageAsset(name: "tvShow")
  internal static let tvShowtapped = ImageAsset(name: "tvShowtapped")
  internal static let lol = ImageAsset(name: "LOL")
  internal static let loll = ImageAsset(name: "LOLL")
  internal static let loLbanner = ImageAsset(name: "LOLbanner")
  internal static let banner1 = ImageAsset(name: "banner1")
  internal static let banner2 = ImageAsset(name: "banner2")
  internal static let banner3 = ImageAsset(name: "banner3")
  internal static let banner5 = ImageAsset(name: "banner5")
  internal static let braw = ImageAsset(name: "braw")
  internal static let fifa = ImageAsset(name: "fifa")
  internal static let ghenshin = ImageAsset(name: "ghenshin")
  internal static let movie00 = ImageAsset(name: "movie00")
  internal static let movie1 = ImageAsset(name: "movie1")
  internal static let movie2 = ImageAsset(name: "movie2")
  internal static let movie3 = ImageAsset(name: "movie3")
  internal static let movie4 = ImageAsset(name: "movie4")
  internal static let movieo = ImageAsset(name: "movieo")
  internal static let movies = ImageAsset(name: "movies")
  internal static let music0 = ImageAsset(name: "music0")
  internal static let music1 = ImageAsset(name: "music1")
  internal static let music2 = ImageAsset(name: "music2")
  internal static let music3 = ImageAsset(name: "music3")
  internal static let music4 = ImageAsset(name: "music4")
  internal static let musicbanner = ImageAsset(name: "musicbanner")
  internal static let pokemon = ImageAsset(name: "pokemon")
  internal static let subway = ImageAsset(name: "subway")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
