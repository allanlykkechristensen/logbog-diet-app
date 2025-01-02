#
//  ci_post_clone.sh
//  Logbog Diet
//
//  Created by Allan Lykke Christensen on 02/01/2025.
//

defaults write com.apple.dt.Xcode IDESkipPackagePluginFingerprintValidatation -bool YES

brew install swiftlint

defaults write com.apple.dt.Xcode IDESkipPackagePluginFingerprintValidatation -bool
