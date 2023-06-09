const express = require("express");
const { TracksModels } = require("../models");
const {
  response,
  retOK,
  retError,
  retNotFound,
} = require("../utils/handleHtpp");
const { matchedData } = require("express-validator");

/**
 *  Todos los items de la coleccion
 * @param {*} req
 * @param {*} res
 */

const getItems = async (req, res) => {
  const data = await TracksModels.find({});

  const total = data.length;
  if (total > 0) {
    datos = {
      total: total,
      data: data,
    };
    response(retOK, datos, res);
  } else {
    response(retError, "No hay datos", res);
  }
};

/**
 *Un item de la coleccion
 * @param {*} req
 * @param {*} res
 */

// TODO no funciona

const getItem = async (req, res) => {
  try {
    req = matchedData(req);
    const { id } = req;

    const data = await TracksModels.findById(id);

    response(retOK, data, res);
  } catch (e) {
    //handleHttpError(res,"ERROR_GET_ITEM")
    response(retError, "ERROR_GET_ITEM", res);
  }
};
/**
 *Crear un item de la coleccion

 * @param {*} req
 * @param {*} res
 */
const createItem = async (req, res) => {
  try {
    const body = matchedData(req);

    const data = await TracksModels.create(body);
    response(retOK, data, res);
  } catch (error) {
    response(retError, "Error al crear item", res);
  }
};
/**
 *Actualizar un item de la coleccion
 * @param {*} req
 * @param {*} res
 */

const updateItem = async (req, res) => {
  try {
    const { id, ...body } = matchedData(req);

    const data = await TracksModels.findOneAndUpdate(id, body);
    response(retOK, data, res);
  } catch (error) {
    response(retError, "Error al actualizar item", res);
  }
};
/**
 *Eliminar un item de la coleccion
 * @param {*} req
 * @param {*} res
 */

const deleteItem = async (req, res) => {
  try {
    req = matchedData(req);
    const { id } = req;

    const data = await TracksModels.delete({ _id: id });

    response(retOK, data, res);
  } catch (e) {
    //handleHttpError(res,"ERROR_GET_ITEM")
    response(retError, "ERROR_DELETE_ITEM", res);
  }
};

module.exports = {
  getItems,
  getItem,
  createItem,
  updateItem,
  deleteItem,
};
