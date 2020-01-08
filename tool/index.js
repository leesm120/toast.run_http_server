const express = require('express');
const app = express();
const path = require('path');

app.get('/:file(*)',(req,res) => {
  var file = req.params.file;
  var fileLocation = path.join('./',file);
  console.log(fileLocation);
  res.download(fileLocation, file);
});

app.listen(80, () => {
  console.log(`running`);
});
