const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello World! DEPI project');
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${3000}`);
});

