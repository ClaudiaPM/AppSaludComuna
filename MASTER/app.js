const express = require("express");
const cors = require("cors");
// const dbConnect = require("./config/mongo");
const { sequelize, Conexion } = require("./config/mysql");
require("dotenv").config();
const app = express();
const swaggerUI = require("swagger-ui-express");
const openApiConfigration = require("./docs/swagger");

app.use(cors());
app.use(express.json());
app.use(express.static("storage"));
app.use(
  "/documentation",
  swaggerUI.serve,
  swaggerUI.setup(openApiConfigration)
);

app.use("/api", require("./routes"));

const port = process.env.PORT || 3001;

app.listen(port, () => {
  console.log(`Server is running on port: http://localhost:${port}`);
});


// dbConnect();
Conexion();
