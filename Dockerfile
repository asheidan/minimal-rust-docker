FROM ekidd/rust-musl-builder AS buildcontext


COPY Cargo.toml /home/rust/src
COPY src /home/rust/src/src/

RUN cargo build --release
RUN strip /home/rust/src/target/x86_64-unknown-linux-musl/release/dockerrust

###############################################################################

FROM scratch

EXPOSE 3000

COPY --from=buildcontext /home/rust/src/target/x86_64-unknown-linux-musl/release/dockerrust /entrypoint

ENTRYPOINT ["/entrypoint"]
