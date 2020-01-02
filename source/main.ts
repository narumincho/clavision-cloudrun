import * as express from "express";
import * as pg from "pg";

const app = express();

const client = new pg.Client({
  user: "postgres",
  password: process.env.POSTGRES_PASSWORD
});
client.connect();

const port = process.env.PORT;
console.log(port);
app.get("/", (request, response) => {
  response.contentType("text/html").send(`
  <!doctype html>
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
            Cloud Run で Node のサーバーを起動できた! by ナルミンチョ
        </body>
        
        </html>`);
});
app.post("/p", async (request, response) => {
  const result = await client.query(request.body);
  response.contentType("application/json").send(JSON.stringify(result));
});
app.listen(port ?? 3000, () => {
  console.log("port番号" + port + "で受付中");
});
