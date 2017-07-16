# Installing protoc
In order to build Haskell packages with `proto-lens`, the Google protobuf
compiler (which is a standalone binary named `protoc`) needs to be installed
somewhere on your `$PATH`.  You can get it by downloading the corresponding
file for your system from https://github.com/google/protobuf/releases.   (The
corresponding file will be named something like `protoc-*-.zip`.)

Here are some OS-specific options for installing the binary:

## Mac OS X

- If you have Homebrew (which you can get from https://brew.sh), just run:

      brew install protobuf

  If you see any error messages, run `brew doctor`, follow any recommended
  fixes, and try again.  If it still fails, try instead:

      brew upgrade protobuf

- Alternately, run the following commands:

      PROTOC_ZIP=protoc-3.3.0-osx-x86_64.zip
      curl -OL https://github.com/google/protobuf/releases/download/v3.3.0/$PROTOC_ZIP
      sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
      rm -f $PROTOC_ZIP

## Linux
- Run the following commands:

      PROTOC_ZIP=protoc-3.3.0-linux-x86_64.zip
      curl -OL https://github.com/google/protobuf/releases/download/v3.3.0/$PROTOC_ZIP
      sudo unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
      rm -f $PROTOC_ZIP

- Alternately, manually download and install `protoc` from [here](https://github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip).
