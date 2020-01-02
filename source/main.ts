import * as express from "express";

const app = express();

const port = process.env.PORT;
console.log(port);
app.set("port", port ?? 3000);
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
