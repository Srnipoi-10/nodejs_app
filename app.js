// app.js
const express = require('express');
const app = express();
const port = 80;

// Главная страница
app.get('/', (req, res) => res.send('Hello World! Antony dumb! But maybe not so...'));

// Динамическое приветствие
app.get('/greet/:name', (req, res) => {
    const name = req.params.name;
    res.send(`Hello, ${name}! Welcome to our site. Not bad at all!!!`);
});

app.listen(port, () => console.log(`App listening at http://localhost:${port}`));
