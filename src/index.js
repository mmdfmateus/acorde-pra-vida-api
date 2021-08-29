import express from 'express';

const app = express();
const port = 5501;

app.get('/:id', (req, res) => {
  console.log('deu bom');
  res.json({status: 'ok', id: req.params.id});
})

app.listen(port, console.log('Server running on port ' + port));

