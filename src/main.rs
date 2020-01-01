extern crate hyper;
extern crate postgres;
extern crate tokio;

type GenericError = Box<dyn std::error::Error + Send + Sync>;

async fn response_examples(
    _request: hyper::Request<hyper::Body>,
) -> Result<hyper::Response<hyper::Body>, hyper::http::Error> {
    hyper::Response::builder()
        .header(
            hyper::header::CONTENT_TYPE,
            hyper::header::HeaderValue::from_static("text/html"),
        )
        .body(hyper::Body::from(
            "<!doctype html>
        <html lang=\"ja\">
        
        <head>
            <meta charset=\"utf-8\">
            <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">
            <style>
                body {
                    font-size: 48px;
                    color: white;
                    background-color: black;
                }
            </style>
        </head>
        
        <body>
            Cloud Run で Rust のサーバーを起動できた! by ナルミンチョ
            GitHub Actionでのデプロイがうまくいくか!?
        </body>
        
        </html>
        ",
        ))
}

#[tokio::main]
async fn main() -> Result<(), GenericError> {
    let postgres_password = std::env::var("POSTGRES_PASSWORD").unwrap();
    postgres::Config::new()
        .user("postgres")
        .password(postgres_password)
        .connect(postgres::NoTls);

    // match postgres::Config::new()
    //     .user("postgres")
    //     .password(postgres_password)
    //     .connect(postgres::NoTls)
    // {
    //     Ok(mut connection) => match connection.execute("create table user(name text)", &[]) {
    //         Ok(number) => {
    //             println!("postgressへの書き込み成功 {}", number);
    //         }
    //         Err(e) => {
    //             println!("postgressへの書き込み失敗 {}", e);
    //         }
    //     },
    //     Err(e) => println!("postgressと接続できなかった{}", e),
    // }

    let port = match std::env::var("PORT") {
        Ok(value) => value.parse::<u16>().unwrap(),
        Err(_) => 3000,
    };
    let address = ([0, 0, 0, 0], port).into();
    let service = hyper::service::make_service_fn(move |_| {
        async {
            Ok::<_, GenericError>(hyper::service::service_fn(move |req| {
                // Clone again to ensure that client outlives this closure.
                response_examples(req)
            }))
        }
    });
    // Then bind and serve...
    let server = hyper::Server::bind(&address).serve(service);
    println!("Listening on http://{}", address);
    server.await?;
    Ok(())
}
