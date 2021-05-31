const Koa = require('koa');
const { getEnv } = require('./config');
const { createReadStream } = require('fs');
const path = require('path');

const PORT = Number(getEnv('PORT'));
const app = new Koa();

app.use((ctx) => {
  ctx.response.type = 'text/html';
  ctx.body = createReadStream(path.resolve(__dirname, 'static', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`[Frontend] running on PORT ${PORT}`);
});
