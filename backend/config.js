const { config } = require('dotenv');

// store in memory
const { parsed } = config();

/**
 * get env value from .env file
 * @param key - key on .env
 */
const getEnv = (key) => {
  try {
    if (parsed) {
      return parsed[key];
    }
    return {};
  } catch (err) {
    throw new Error('[env] error when get environmet key');
  }
};

module.exports = {
  getEnv,
};
