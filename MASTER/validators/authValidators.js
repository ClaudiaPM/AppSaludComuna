const { check } = require("express-validator");
const validateResults = require("../utils/handleValidator");

const validatorRegister = [
  check("name").notEmpty(),
  check("age").notEmpty().isNumeric(),
  check("email").exists().notEmpty().isEmail(),
  check("password").notEmpty(),
  (req, res, next) => {
    return validateResults(req, res, next);
  },
];

const validatorLogin = [
  check("email").notEmpty().isEmail(),
  check("password").notEmpty(),
  (req, res, next) => {
    return validateResults(req, res, next);
  },
];

module.exports = { validatorRegister, validatorLogin };
