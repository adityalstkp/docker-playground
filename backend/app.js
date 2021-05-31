const express = require('express');
const { json } = require('body-parser');
const pinoMiddleware = require('express-pino-logger');
const { getEnv } = require('./config');

const app = express();
const PORT = Number(getEnv('PORT'));

app.use(pinoMiddleware({ prettyPrint: true }));
app.use(json());

const getLatency = (startTime) => {
  const endTime = process.hrtime(startTime);
  const inMs = (endTime[0] * 1000000000 + endTime[1]) / 1000000;
  return `${inMs}ms`;
};

const apiRouter = express.Router();
apiRouter.get('/user', (_, res) => {
  const start = process.hrtime();
  res.status(200);
  res.send({
    status: 'ok',
    data: { user: 'nakatroops@goto.com' },
    meta_data: {
      type: 'public',
      latency: getLatency(start),
    },
  });
});
app.use('/v1', apiRouter);

app.listen(PORT, () => {
  console.log(`[Backend] running on PORT ${PORT}`);
});
