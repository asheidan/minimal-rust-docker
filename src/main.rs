extern crate iron;

use iron::prelude::*;
use iron::status;

fn hello_world(_: &mut Request) -> IronResult<Response> {
    println!("Received request!");
    Ok(Response::with((status::Ok, "Hello World!")))
}

fn main() {
    println!("Listening on port 3000");
    Iron::new(hello_world).http("0.0.0.0:3000").unwrap();
}
