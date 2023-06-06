const swaggerJsdoc = require("swagger-jsdoc");

/**
 * API Config Info
 */

const swaggerDefinition = {
  openapi: "3.0.0",
  info: {
    title: "Documentacion de la API Hackaton 2023",
    version: "1.0.1",
  },
  servers: [
    {
      url: "http://localhost:3001/api",
    },
  ],
  components: {
    securitySchemes: {
      bearerAuth: {
        type: "http",
        scheme: "bearer",
      },
    },
    schemas: {
      authLogin: {
        type: "object",
        required: ["email", "password"],
        properties: {
          email: {
            type: "string",
          },
          password: {
            type: "string",
          },
        },
      },
      authRegister: {
        type: "object",
        required: ["email", "password", "age", "name"],
        properties: {
          name: {
            type: "string",
          },
          age: {
            type: "integer",
          },
          email: {
            type: "string",
          },
          password: {
            type: "string",
          },
        },
      },
    },
  },
};

/**
 * Opciones
 */
const options = {
  swaggerDefinition,
  apis: ["./routes/*.js"],
};

const openApiConfigration = swaggerJsdoc(options);

module.exports = openApiConfigration;
