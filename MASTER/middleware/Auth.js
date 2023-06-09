const express = require("express");
const { UsersModels } = require("../models/index");
const {
  response,
  retOK,
  retError,
  retNotFound,
} = require("../utils/handleHtpp");

const validarEmail = async (req, res, next) => {
  const { email } = req.body;
  const find_email = await UsersModels.findOne({
    where: { email: email },
  });
  if (find_email) {
    response(retError, "El email ya existe en la base de datos", res);
  } else {
    next();
  }
};

module.exports = { validarEmail };
