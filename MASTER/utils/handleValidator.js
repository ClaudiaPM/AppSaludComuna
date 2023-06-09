const { validationResult } = require("express-validator");
const {
  response,
  retOK,
  retError,
  retNotFound,
} = require("../utils/handleHtpp");

const validateResults = (req, res, next) => {
  try {
    validationResult(req).throw();
    return next(); //TODO Continua hacia el controlador!
  } catch (err) {
    response(retError, err.array(), res);
  }
};

module.exports = validateResults;
