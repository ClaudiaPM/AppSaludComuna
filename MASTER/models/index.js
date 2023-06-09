// const models = {
//   UsersModels: require("./nosql/users"),
//   TracksModels: require("./nosql/tracks"),
//   StorageModels: require("./nosql/storage"),
//   TokenModels: require("./nosql/token"),
// };

// module.exports = models;

const models = {
  UsersModels: require("./mysql/users"),
  TokenModels: require("./mysql/token"),
};

module.exports = models;
