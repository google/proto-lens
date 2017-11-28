# Changelog for `lens-labels`

## v0.2.0.0
- Improve readability of `HasLens` instances. (#118)
- Remove support for `ghc-7.10`. (#136)
- Use a `.cabal` file that's auto-generated from `hpack`. (#138)
- Add an `IsLabel` instance for `(->)` allowing the use of labels
  in function position. (#157)

## v0.1.0.2
- Bump the dependency on `base` to support `ghc-8.2.1`.
- Build against the new API of `GHC.OverloadedLabels` on newer versions of
  GHC.

## v0.1.0.1
- Make the build `-Wall`-clean.

## v0.1.0.0
- Initial release.
