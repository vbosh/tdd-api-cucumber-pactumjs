const express = require('express')
const app = express()
const port = 3000

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const users = [{
  username: "johndoe",
  firstName: "John",
  lastName: "Doe",
  age: 21
}, {
  username: "janedoe",
  firstName: "Jane",
  lastName: "Doe",
  age: 25
}]

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.get('/users', (req, res) => {
  res.json(users)
})

app.post('/users', (req, res) => {
  const user = req.body;
  console.log(req.body)
  users.push(user)

  res.status(201).send(user)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})