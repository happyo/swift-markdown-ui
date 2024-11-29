import SwiftUI

extension View {
  /// Sets the inline image provider for the Markdown inline images in a view hierarchy.
  /// - Parameter inlineImageProvider: The inline image provider to set. Use one of the built-in values, like
  ///                                  ``InlineImageProvider/default`` or ``InlineImageProvider/asset``,
  ///                                  or a custom inline image provider that you define by creating a type that
  ///                                  conforms to the ``InlineImageProvider`` protocol.
  /// - Returns: A view that uses the specified inline image provider for itself and its child views.
  public func markdownInlineImageProvider(_ inlineImageProvider: InlineImageProvider) -> some View {
    self.environment(\.inlineImageProvider, inlineImageProvider)
  }
    
    public func markdownLocalImageProvider(_ localImageProvider: LocalImageProvider) -> some View {
        self.environment(\.localImageProvider, localImageProvider)
      }
}

extension EnvironmentValues {
  var inlineImageProvider: InlineImageProvider {
    get { self[InlineImageProviderKey.self] }
    set { self[InlineImageProviderKey.self] = newValue }
  }
}

private struct InlineImageProviderKey: EnvironmentKey {
  static let defaultValue: InlineImageProvider = .default
}

extension EnvironmentValues {
    var localImageProvider: LocalImageProvider {
      get { self[LocalImageProviderKey.self] }
      set { self[LocalImageProviderKey.self] = newValue }
    }
}

private struct LocalImageProviderKey: EnvironmentKey {
  static let defaultValue: LocalImageProvider = .default
}


/// The default inline image provider, which loads images from the network.
public struct DefaultLocalImageProvider: LocalImageProvider {
    public func localImage(with urlString: String) -> Image? {
        return nil
    }
}

extension LocalImageProvider where Self == DefaultLocalImageProvider {
  /// The default inline image provider, which loads images from the network.
  ///
  /// Use the `markdownInlineImageProvider(_:)` modifier to configure
  /// this image provider for a view hierarchy.
  public static var `default`: Self {
    .init()
  }
}
