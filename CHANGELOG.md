# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- Initial package release.
- Extensions for applying decorations, gestures, padding, margin, animations, etc.
- Provided various utilities for widget transformations, such as scale, rotate, offset, and opacity adjustments.

## [0.0.1] - 2025-02-18

### Added

- **Core functionality**:
  - Extensions on `Widget` for `textStyle`, `padding`, `margin`, and `decorate`.
  - Support for common gestures: `onTap`, `onLongPress`, `onPanUpdate`, and `onTapRipple`.
  - Animation utilities for `animatedOpacity`, `animatedContainer`, and `animatedCrossFade`.
  - Layout utilities such as `aspectRatio`, `center`, and alignment helpers.
- **Positioning**:

  - `positioned` extension for using widgets inside `Stack` with top, bottom, left, right positioning.

- **Visibility and Opacity**:

  - `visibility` extension to toggle widget visibility.
  - `withOpacity` extension to adjust widget opacity.

- **Transformations**:
  - `rotate`, `scale`, and `offset` extensions for transforming widgets.
- **Overlay & Background**:
  - Added `overlay` and `background` extensions to stack widgets with customizable alignment and clipping behavior.

### Changed

- No breaking changes in this initial release.

### Fixed

- N/A

## [0.0.1] - 2025-02-10

### Added

- Early draft of basic widget extensions with core utility functions like `textStyle` and `padding`.
- Basic gesture handler extensions, such as `onTap` and `onLongPress`.

### Changed

- Updated the internal API to allow for more flexible widget transformations.

### Fixed

- Initial bugs in margin and padding handling that led to layout issues in specific use cases.
