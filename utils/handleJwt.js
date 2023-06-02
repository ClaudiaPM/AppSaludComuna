const jwt = require("jsonwebtoken");
const moment = require("moment");
require("dotenv").config();
const { TokenModels } = require("../models");

const TOKEN_SECRET = process.env.JWT_SECRET;

const generateToken = async (userId) => {
  const expireAt = moment().add(process.env.JWT_EXPIRES_IN, "seconds").toDate();
  const { id } = userId;
  const token = jwt.sign({ id }, TOKEN_SECRET, { expiresIn: 120 });
  await TokenModels.create({ user_id: id, token, expire_at: expireAt });
  const data = {
    token_type: "Bearer",
    user: userId,
    access_token: token,
    expires_in: process.env.JWT_EXPIRES_IN,
  };
  return data;
};

const validateToken = async (token) => {
  try {
    const decoded = jwt.verify(token, TOKEN_SECRET);
    const existingToken = await TokenModels.findOne({
      where: { user_id: decoded.userId, token },
    });
    if (!existingToken || existingToken.expire_at < moment().toDate()) {
      return false;
    }
    return true;
  } catch (error) {
    return false;
  }
};

module.exports = {
  generateToken,
  validateToken,
};
