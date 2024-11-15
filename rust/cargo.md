# tools目录

~/.cargo/bin   include rustc, cargo, rustup


# 基本运行

```shell
cargo new hello_cargo # 自动生成hello_cargo项目
cd hello_cargo
cargo new --vcs=git

Cargo.toml
# hello_cargo/src/main.rs
cargo build # 在hello_cargo下打包
# 在hello_cargo/target/debug下，生成hello_cargo或者hello_cargo.exe执行文件
cargo run # 在hello_cargo运行
cargo check # 确认编译但是不生成可执行文件
cargo build --release # 生成到target/release下而不是debug

$ git clone example.org/someproject
$ cd someproject
$ cargo build
```

# 其他

cargo doc --open
