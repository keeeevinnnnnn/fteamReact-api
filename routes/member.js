const express = require('express');
const db = require('../modules/connect_db');
const router = express.Router();
const Joi = require('joi');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
require('dotenv').config();
const upload = require('../modules/upload-avatar');

router.get('/login', async (req, res) => {
    res.render('login');
});

// 註冊
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

    const find = schema.validate(req.body, { abortEarly: false });

    if (find.error) {
        output.code = 401;
        output.error = '資料有錯誤';
        return res.json(output);
    }

    const sql =
        'INSERT INTO `member`(`mem_name`,`mem_nickname`,`mem_level`,`mem_account`,`mem_password`, `mem_email`, `mem_mobile`, `mem_birthday`, `mem_address`, `mem_avatar`, `mem_bollen`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)';

    // 給他們預設值 (前端不給欄位)
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
        account,
        password,
        email,
        mobile,
        birthday,
        address,
        avatar,
    } = req.body;

    // 密碼加密再存進資料庫
    const hash = bcrypt.hashSync(password);

    const [result] = await db.query(sql, [
        name,
        nickname,
        '平民',
        account,
        hash,
        email,
        mobile,
        birthday,
        address,
        avatar,
    ]);

    output.success = true;
    res.json(output);
});

// 登入 JWT
router.post('/login', upload.none(), async (req, res) => {
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
    const compareResult = await bcrypt.compare(
        req.body.password,
        row.mem_password
    );

    if (!compareResult) {
        output.error = '密碼錯誤';
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
    output.info = {
        mem_account,
        mem_nickname,
        new: output.new,
        mem_avatar,
        grade: output.grade,
    };

    // 進行加密讓前端頁面看不出來
    output.token = jwt.sign(
        {
            sid,
            mem_created_at,
        },
        process.env.JWT_KEY
    );

    res.json(output);
});

// 資料修改
router.post('/edit', upload.none(), async (req, res) => {
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
        //可以是任何類型
        birthday: Joi.any(),
        address: Joi.any(),
    });

    const find = schema.validate(req.body, { abortEarly: false });

    if (find.error) {
        output.code = 401;
        output.error = '資料有錯誤';
        return res.json(output);
    }

    const sql = `UPDATE member SET mem_name=?,mem_nickname=?,mem_account=?,mem_email=?,mem_mobile=?,mem_birthday=?,mem_address=? WHERE sid=${res.locals.user.sid}`;

    // 如果沒填 給空字串
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

    const { name, nickname, account, email, mobile, birthday, address } =
        req.body;

    const [result] = await db.query(sql, [
        name,
        nickname,
        account,
        email,
        mobile,
        birthday,
        address,
    ]);

    output.success = true;
    res.json(output);
});

// 密碼修改
router.post('/password', upload.none(), async (req, res) => {
    const output = {
        success: false,
        code: 0,
        error: '',
    };

    // 取得原密碼
    const [password] = await db.query(
        `SELECT mem_password FROM member WHERE sid=${res.locals.user.sid}`
    );

    const user_passsword = password[0].mem_password;

    // 對比用戶輸入的原密碼是否一樣
    const compareResult = await bcrypt.compare(
        req.body.old_password,
        user_passsword
    );

    if (!compareResult) {
        output.code = 401;
        output.error = '原密碼不符';
        return res.json(output);
    }

    //後端檢查用 格式
    const schema = Joi.object({
        old_password: Joi.string().required(),
        new_password: Joi.string().required(),
    });

    const find = schema.validate(req.body, { abortEarly: false });

    if (find.error) {
        output.code = 402;
        output.error = '新密碼格式不符';
        return res.json(output);
    }

    // 更改密碼
    const sql = `UPDATE member SET mem_password=? WHERE sid=${res.locals.user.sid}`;

    const { new_password } = req.body;

    // 新密碼加密後存資料庫
    const hash = bcrypt.hashSync(new_password);

    const [result] = await db.query(sql, [hash]);

    output.success = true;
    res.json(output);
});

// 刪除帳號
router.delete('/', (req, res) => {
    const sql = db.query(`DELETE FROM member WHERE sid=${res.locals.user.sid}`);
});

router.post('/upload', upload.single('avatar'), (req, res)=>{
    res.json(req.file);
});

module.exports = router;
