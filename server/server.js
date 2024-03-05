require("dotenv").config()

const express = require("express");
const db = require("./db");
const app = express();
const port = process.env.PORT;
app.use(express.json());


const songRoute = require('./routes/songs');
const artistRoute = require('./routes/artist');
const adminRoute = require('./routes/admin');
const userRoute = require('./routes/user');
const loginRoute = require('./routes/login');
const registerRoute = require('./routes/register');
const albumRoute = require('./routes/album');
const trendingRoute = require('./routes/trending');
const genreRoute = require('./routes/genre');

app.use('/api/v1/song', songRoute);
app.use('/api/v1/artist', artistRoute);
app.use('/api/v1/admin', adminRoute);
app.use('/api/v1/user', userRoute);
app.use('/api/v1/login', loginRoute);
app.use('/api/v1/register', registerRoute);
app.use('/api/v1/album', albumRoute);
app.use('/api/v1/trending', trendingRoute);
app.use('/api/v1/genre', genreRoute);

app.listen(port, () => {
    console.log(`server is up and running on port ${port}`);
});


//add album
app.post("/api/v1/album", (req, res) => {
    //add artist sql
})
//add genre
app.post("/api/v1/genre", (req, res) => {
    //add artist sql
});
