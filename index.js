require("dotenv").config();
const express = require("express");
const app = express();
const cors = require("cors");
const { json } = require("express/lib/response");
const db = require("./modules/connect_db");
const { v4: uuidv4 } = require("uuid");
const session = require("express-session");
const MysqlStore = require("express-mysql-session")(session);
const sessionStore = new MysqlStore({}, db);
const moment = require("moment-timezone");
const upload = require("./modules/upload-images");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser")

// 聊天室建立sever
const http = require('http');
const { Server } = require('socket.io');

const server = http.createServer(app);
const io = new Server(server,{
    cors:{
        origin: "http://localhost:3001",
        methods: ["GET","POST"],
    }
});

// static folder
app.use(express.static("errPage"));
app.use("/", express.static(__dirname + "/public"));
// cors setting
app.use(cors());

//bodyparser
app.use(bodyParser.json({limit:'50mb'}))
app.use(bodyParser.urlencoded({limit:'50mb',extended:true}))

//ejs set
app.set("view engine", "ejs");
app.set("case sensitive routing", true);

// top level middleware
// session setting
app.use(
  session({
    saveUninitialized: false,
    resave: false,
    secret: "nfkdsnonlgfkewngrer4ngqoerwnggrkqwngpirgqgnprwgnkpr", // 加密用
    store: sessionStore,
    cookie: {
      maxAge: 1800000, // 30 min
    },
  })
);

app.use((req, res, next) => {
  // 如果有 token 就解析(驗證)完放在 res.locals.user
  res.locals.user = null; // 自訂的變數, 設定有沒有身份驗證, 預設值為 null
  let user = req.get("Authorization");
  if (user && user.indexOf("Bearer ") === 0) {
    user = user.slice(7);
    const payload = jwt.verify(user, process.env.JWT_KEY);
    res.locals.user = payload;
  }
  next();
});

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//socket連接
io.on('connection', (socket) => {
  //連上message(單純名稱) 會有name跟message
  socket.on('message', ({ name, message, sid, img }) => {
      //發出消息時
      io.emit('message', { name, message,sid ,img});
  });
});

// 會員頭貼
app.use("/avatar", express.static(__dirname + "/public/avatar"));
// ------------------ routes start -----------------------

app.use("/admin", require(__dirname + "/routes/admin"));
app.use("/member", require(__dirname + "/routes/member"));
app.use("/carts", require(__dirname + "/routes/carts.js"));
app.use("/orders", require(__dirname + "/routes/orders.js"));
app.use("/product", require(__dirname + "/routes/product"));
app.use("/productGet", require(__dirname + "/routes/productGet"));
app.use("/custom", require(__dirname + "/routes/custom"));

// app.use('/test', require(__dirname + '/routes/test.js')); // 借我測試用  p.s.阿嘎留
// ------------------ routes end -------------------------
app.get("/", (req, res) => {
  res.send("<h1>http://localhost:3000 is test running</h1>");
});
// 404
app.use((req, res) => {
  res.send(`<h2>404 找不到頁面</h2>
    <img src="/errorpage.png" alt="" width="500px">
    `);
});
app.listen(3000, () => {
  console.log(`server started: http://localhost:3000`);
});

// 聊天室連線
server.listen(4000, function () {
  console.log('listening on port 4000');
});
