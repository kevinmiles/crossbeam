#!/bin/bash

cd "$(dirname "$0")"/../crossbeam-skiplist
set -ex

export RUSTFLAGS="-D warnings"

cargo check --bins --examples --tests
cargo test

if [[ "$RUST_VERSION" == "nightly"* ]]; then
    cargo test --features nightly
fi
