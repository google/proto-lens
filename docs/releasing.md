# Release Instructions

Instructions for releasing a new version of these libraries to Hackage.

Note that the test/benchmark/tutorial packages should **not** be uploaded to Hackage,
since they are intended only for use within this repository:

- `proto-lens-benchmarks`
- `proto-lens-tests`
- `proto-lens-tests-dep`
- `proto-lens-tutorial/*`

## Prerequisites
- Make sure that the descriptors have been bootstrapped by running `runghc bootstrap.hs`.
- Make sure that each package's version number has been bumped and conforms to the PVP.
- Make sure each package's `Changelog.md` file is up-to-date.
- Make sure you are on a commit that has been merged upstream to `google/proto-lens`.

## Steps
First, run `stack build` at the top level.  Then, for each package that you want to upload, run

        stack upload {name-of-package}

Then verify that they've been uploaded successfully by visiting `hackage.org` in a web browser.
