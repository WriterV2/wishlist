use std::env;

use dotenvy::dotenv;
use sqlx::sqlite::SqlitePoolOptions;

#[tokio::main]
async fn main() {
    dotenv().ok();
    let db_url =
        &env::var("DATABASE_URL").expect("Failed to get environment variable DATABASE URL");

    let pool = SqlitePoolOptions::new()
        .connect(db_url)
        .await
        .expect("Failed to connect to database");

    sqlx::migrate!()
        .run(&pool)
        .await
        .expect("Failed to run migrations");
}
