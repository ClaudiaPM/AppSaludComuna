const retOK = "OK";
const retError = "ERROR";
const retDenyBot = "BOT";
const retNotFound = "NOTFOUND";

const response = (resultado, datos, res) => {
  codigo = 200;
  codigo = 200;
  if (resultado == null) {
    resultado = !datos ? retError : retOK;
  }

  if (resultado === retError) {
    codigo = 400;
  }

  respuesta = {
    resultado: resultado,
    datos: datos,
    entregado: new Date(),
  };

  res.status(codigo).json(respuesta); // Send the response to the client
};

module.exports = {
  response,
  retOK,
  retError,
  retNotFound,
};
