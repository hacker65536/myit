# aws-sdk-rust

https://github.com/awslabs/aws-sdk-rust


## example

```console
❯ rustc --version
rustc 1.58.1 (db9d1b20b 2022-01-20)

❯ cargo --version
cargo 1.58.0 (f01b232bc 2022-01-19)
```


```console
❯ cargo new  aws-rust-example
```

`Cargo.toml`
```ini
[package]
name = "aws-rust-example"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
aws-config = "0.6.0"
aws-sdk-dynamodb = "0.6.0"
tokio = { version = "1", features = ["full"] }
```

`main.rs`
```rust
use aws_sdk_dynamodb::{Client, Error};

#[tokio::main]
async fn main() -> Result<(), Error> {
    let shared_config = aws_config::load_from_env().await;
    let client = Client::new(&shared_config);
    let req = client.list_tables().limit(10);
    let resp = req.send().await?;
    println!("Current DynamoDB tables: {:?}", resp.table_names);
    Ok(())
}
```

```console
❯ cargo build
```


```console
❯ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.05s
     Running `target/debug/awsrust-example`
Current DynamoDB tables: Some(["test-table1", "test-table12"])
```
