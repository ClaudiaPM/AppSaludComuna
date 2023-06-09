const crypto = require("crypto");
const fs = require("fs");
const dotenv = require("dotenv");
dotenv.config();

function generateSecret() {
  const randomBytes = crypto.randomBytes(32);
  return randomBytes.toString("hex");
}

function setEnvVariable(key, value) {
  const envConfig = dotenv.parse(fs.readFileSync(".env"));

  envConfig[key] = value;

  const envConfigString = Object.keys(envConfig)
    .map((key) => `${key}=${envConfig[key]}`)
    .join("\n");

  fs.writeFileSync(".env", envConfigString);
}

function updateJwtSecret() {
  const newSecret = generateSecret();
  setEnvVariable("JWT_SECRET", newSecret);
  return newSecret;
}

module.exports =  updateJwtSecret;
