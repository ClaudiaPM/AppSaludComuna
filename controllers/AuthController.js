const { UsersModels } = require("../models");
const { encrypt, compare } = require("../utils/handleAuth");
const { generateToken, validateToken } = require("../utils/handleJwt");

const {
  response,
  retOK,
  retError,
  retNotFound,
} = require("../utils/handleHtpp");
const { matchedData } = require("express-validator");

const register = async (req, res) => {
  try {
    req = matchedData(req);
    const { name, age, email, password } = req;
    const hash = await encrypt(password);
    const data = await UsersModels.create({
      name: name,
      age: age,
      email: email,
      password: hash,
    });
   // response(retOK, data, res);


    //quiero que cuando regrese la data del usuario no venga la password
    data.password = undefined;
    const token = await generateToken(data);
    response(retOK, token, res);
  } catch (error) {
    console.log(error);
    response(retError, "Error al registrar el usuario", res);
  }
};

const login = async (req, res) => {
  req = matchedData(req);

  // res.send(req)

  const { email, password } = req;
  // response(retOK, email, res);

  const validate_email = await UsersModels.findOne({ email: email });
  if (!validate_email) {
    response(retNotFound, "El email no existe en la base de datos", res);
    return;
  }

  const validate_password = await compare(password, validate_email.password);

  if (!validate_password) {
    response(retError, "La contraseña es incorrecta", res);
    return;
  }
  validate_email.password = undefined;
  const token = await generateToken(validate_email);

  response(retOK, token, res);
};

module.exports = { register, login };
