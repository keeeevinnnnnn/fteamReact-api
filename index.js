require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');
const { json } = require('express/lib/response');
const db = require('./modules/connect_db');
const { v4: uuidv4 } = require('uuid');
const session = require('express-session');
const MysqlStore = require('express-mysql-session')(session);
const sessionStore = new MysqlStore({},db);
const moment = require('moment-timezone');
const upload = require('./modules/upload-images');

// cors setting
app.use(cors());

//ejs set
app.set('view engine','ejs');
app.set('case sensitive routing', true);

// top level middleware
// session setting
app.use(session({
    saveUninitialized: false,
    resave: false,
    secret: 'nfkdsnonlgfkewngrer4ngqoerwnggrkqwngpirgqgnprwgnkpr', // 加密用
    store: sessionStore,
    cookie:{
        maxAge:1800000, // 30 min
    }
}))
app.use(express.urlencoded({extended: false}));
app.use(express.json());
// ------------------ routes start -----------------------


app.use('/member',require(__dirname+'/routes/member'));

app.use('/cart',require(__dirname+'/routes/cart.js'));
// ------------------ routes end -------------------------
app.get('/',(req,res)=>{
    res.send('<h1>http://localhost:3000 is test running</h1>');
})
// 404
app.use((req,res)=>{
    res.send("<h2>404 not found</h2>")
})
app.listen(3000,()=>{
    console.log('Serve is running.');
});