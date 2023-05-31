const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");

const {
  validatorRegister,
  validatorLogin,
} = require("../validators/authValidators");
const { validarEmail } = require("../middleware/Auth");

const { register, login } = require("../controllers/AuthController");

/**
 * Todo : ruta para registrar un usuario
 */
router.post("/register", validatorRegister, register);

/**
 * Todo : ruta para iniciar sesión
 *
 * @param {string} email - email del usuario
 * @param {string} password - password del usuario
 *
 * @returns {object} - {token: string}
 *
 */
router.post("/login",  validatorLogin, login);

module.exports = router;
