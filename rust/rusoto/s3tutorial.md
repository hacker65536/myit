

```
cargo new s3example
```


```toml
[package]
name = "rustaws"
version = "0.1.0"
authors = ["ec2-user"]
edition = "2018"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
rusoto_core = "0.41.0"
rusoto_s3 = "0.41.0"
```


```rust
extern crate rusoto_core;
extern crate rusoto_s3;

use rusoto_core::Region;
use rusoto_s3::{S3,S3Client};


fn main() {

    let region =Region::UsEast1;
    let client=S3Client::new(region);



    match client.list_buckets().sync() {
        Ok(output) => {
            if let Some(buckets)= output.buckets {
                for bucket in buckets.iter() {
                    println!("{}", bucket.name.as_ref().unwrap());
                }
            }
        },
        Err(error) => {
            println!("Error: {:?}", error);
        }
    }
}
```
