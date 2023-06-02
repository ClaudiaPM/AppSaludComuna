const mongoose = require("mongoose");
const mongooseDelete = require("mongoose-delete");
const Userscheme = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },
    age: {
      type: Number,
    },
    email: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,

    },
    role: {
      type: ["user", "admin"],
      default: "user",
    },
  },
  {
    timestamps: true, //TODO
    versionKey: false,
  }
);
Userscheme.plugin(mongooseDelete, { overrideMethods: "all" });

module.exports = mongoose.model("users", Userscheme);
