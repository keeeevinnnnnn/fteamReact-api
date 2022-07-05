require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');
const { json } = require('express/lib/response');
const db = require('./modules/connect_db');
const { v4: uuidv4 } = require('uuid');
const session = require('express-session');
const MysqlStore = require('express-mysql-session')(session);
const sessionStore = new MysqlStore({}, db);
const moment = require('moment-timezone');
const upload = require('./modules/upload-images');
const jwt = require('jsonwebtoken');

// static folder
app.use(express.static('errPage'))
// cors setting
app.use(cors());

//ejs set
app.set('view engine', 'ejs');
app.set('case sensitive routing', true);

// top level middleware
// session setting
app.use(
    session({
        saveUninitialized: false,
        resave: false,
        secret: 'nfkdsnonlgfkewngrer4ngqoerwnggrkqwngpirgqgnprwgnkpr', // 加密用
        store: sessionStore,
        cookie: {
            maxAge: 1800000, // 30 min
        },
    })
);

app.use((req, res, next) => {
    // 如果有 token 就解析(驗證)完放在 res.locals.user
    res.locals.user = null; // 自訂的變數, 設定有沒有身份驗證, 預設值為 null
    let user = req.get('Authorization');
    if (user && user.indexOf('fteam') === 0) {
        user = user.slice(5);
        const payload = jwt.verify(user, process.env.JWT_KEY);
        res.locals.user = payload;
    }
    next();
});

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
// ------------------ routes start -----------------------

app.use('/admin', require(__dirname + '/routes/admin'));
app.use('/member', require(__dirname + '/routes/member'));
app.use('/carts', require(__dirname + '/routes/carts.js'));
app.use('/orders', require(__dirname + '/routes/orders.js'));
// ------------------ routes end -------------------------
app.get('/', (req, res) => {
    res.send('<h1>http://localhost:3000 is test running</h1>');
});
// 404
app.use((req, res) => {
    res.send(`<h2>404 找不到頁面</h2>
    <img src="/errorpage.png" alt="" width="500px">
    `)
});
app.listen(3000, () => {
    console.log(`server started: http://localhost:3000`);
});
