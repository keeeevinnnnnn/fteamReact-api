const express = require('express');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images');
const Joi = require('joi');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
require('dotenv').config();

router.get('/login', async (req, res)=>{
    res.render('login');
});

// 會員登入
router.post('/login', upload.none(), async (req, res) => {
    console.log(res.locals.user.sid);
    const output = {
        success: false,
        bollen: false,
        new: false,
        grade: 'low',
        token: '',
        info: null,
        code: 0,
        error: '',
    };

    const [rs] = await db.query('SELECT * FROM member WHERE mem_account=?', [
        req.body.account,
    ]);

    if (!rs.length) {
        output.error = '帳密錯誤';
        output.code = 401;
        return res.json(output);
    }

    const row = rs[0];

    // 資料庫密碼解密
    const compareResult = await bcrypt.compare(req.body.password, row.mem_password);

    if (! compareResult) {
        output.error = '帳密錯誤';
        output.code = 402;
        return res.json(output);
    }

    if (row.mem_bollen == 1) {
        output.bollen = true;
    } else {
        output.error = '帳號已被停用';
        output.code = 403;
        return res.json(output);
    }

    const { sid, mem_account, mem_nickname, mem_created_at, mem_avatar } = row;

    const now = new Date();
    const newOld = now - mem_created_at;

    // 86400000是24小時的毫秒數
    if (newOld < 86400000) {
        output.new = true;
    }

    output.success = true;
    output.info = { mem_account };

    // 未加密前
    // output.token = {
    //     sid,
    //     mem_account,
    //     mem_nickname,
    //     new:output.new,
    //     mem_created_at,
    //     mem_avatar,
    //     grade:output.grade,
    // };

    // 進行加密讓前端頁面看不出來
    output.token = jwt.sign(
        {
            sid,
            mem_account,
            mem_nickname,
            new: output.new,
            mem_created_at,
            mem_avatar,
            grade: output.grade,
        },
        process.env.JWT_KEY
    );

    res.json(output);
});

// 會員註冊
router.post('/add', upload.none(), async (req, res) => {
    const output = {
        success: false,
        code: 0,
        error: '',
    };

    //後端檢查用
    const schema = Joi.object({
        //字串類型
        name: Joi.string()
            //最少2個字
            .min(2)
            //必填欄位
            .required()
            //欄位變數名稱用中文顯示
            .label('姓名必填'),
        nickname: Joi.any(),
        email: Joi.string().email(),
        mobile: Joi.string(),
        account: Joi.string().required(),
        password: Joi.string().required(),
        //可以是任何類型
        birthday: Joi.any(),
        address: Joi.any(),
        avatar: Joi.any(),
    });

    // 自訂訊息
    // https://stackoverflow.com/questions/48720942/node-js-joi-how-to-display-a-custom-error-messages

    const find = schema.validate(req.body, { abortEarly: false });

    // console.log(find);

    if (find.error) {
        (output.code = 401), (output.error = '資料有錯誤');
        return res.json(output);
    }

    const sql =
        'INSERT INTO `member`(`mem_name`,`mem_nickname`,`mem_level`,`mem_account`,`mem_password`, `mem_email`, `mem_mobile`, `mem_birthday`, `mem_address`, `mem_avatar`,  `mem_created_at`, `mem_bollen`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), 1)';

    // 給他們預設值 (前端不給欄位)
    req.body.level = '平民';
    // 如果沒給頭貼
    if (!req.body.avatar) {
        req.body.avatar = '檔案名稱'; //之後給個預設頭貼
    }
    if (!req.body.nickname) {
        req.body.nickname = '';
    }
    if (!req.body.email) {
        req.body.email = '';
    }
    if (!req.body.mobile) {
        req.body.mobile = '';
    }
    if (!req.body.address) {
        req.body.address = '';
    }

    const {
        name,
        nickname,
        level,
        account,
        password,
        email,
        mobile,
        birthday,
        address,
        avatar,
        created,
    } = req.body;

    // 密碼加密再存進資料庫
    const hash = bcrypt.hashSync(password);

    const [result] = await db.query(sql, [
        name,
        nickname,
        level,
        account,
        hash,
        email,
        mobile,
        birthday,
        address,
        avatar,
        created,
    ]);

    // 新增成功顯示在Preview的
    // {"fieldCount":0,"affectedRows":1,"insertId":1113,"info":"","serverStatus":2,"warningStatus":0}
    output.success = true;
    res.json(output);
});

// 刪除帳號
router.delete('/delete', (req, res) => {
    const sql = db.query("DELETE FROM `member` WHERE sid=?", [
        res.locals.user.sid,
    ]);
});

module.exports = router;
