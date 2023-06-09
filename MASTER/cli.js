const yargs = require("yargs");
const updateJwtSecret = require("./utils/handleGenerateJwt");
yargs.command({
  command: "jwt:secret",
  describe: "Generates a new JWT secret key",
  handler: () => {
    const JWT_SECRET = updateJwtSecret();
    console.log(`JWT secret key: ${JWT_SECRET}`);
  },
});

yargs.parse();
