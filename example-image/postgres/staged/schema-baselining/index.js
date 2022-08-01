const dbHost = process.argv[2];
const dbPort = Number(process.argv[3]);
const dbUsername = process.argv[4];
const dbPassword = process.argv[5];

const knex = require("knex")({
  client: "postgres",
  connection: {
    host: dbHost,
    user: dbUsername,
    password: dbPassword,
    port: dbPort,
    database: "postgres",
  },
});

async function baseline() {
  const dbName = "ExampleDb";
  console.log(`*** Creating database [${dbName}]`);
  await knex.raw(`CREATE DATABASE "${dbName}";`);
}

async function start() {
  try {
    await baseline();
  } finally {
    knex.destroy();
  }
}

start();
