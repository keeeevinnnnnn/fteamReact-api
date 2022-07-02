const express = require('express');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images');
const Joi = require('joi');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
require('dotenv').config();

// 管理員登入
router.post('/login', async (req, res) => {
    const output = {
        success: false,
        grade: 'hight',
        token: '',
        info: null,
        code: 0,
        error: '',
    };

    const [rs] = await db.query('SELECT * FROM admin WHERE ad_account=?', [
        req.body.account,
    ]);

    if (!rs.length) {
        output.error = '帳密錯誤';
        output.code = 401;
        return res.json(output);
    }

    const row = rs[0];

    if (req.body.password !== row.ad_password) {
        output.error = '帳密錯誤';
        output.code = 402;
        return res.json(output);
    }

    const { sid, ad_account, ad_avatar } = row;

    output.success = true;
    output.info = { ad_account };

    // 進行加密讓前端頁面看不出來
    output.token = jwt.sign(
        {
            sid,
            ad_account,
            ad_avatar,
            grade: output.grade,
        },
        process.env.JWT_KEY
    );

    res.json(output);
});

// 停用會員
router.get('/false/:sid', (req, res) => {
    const sql = db.query('UPDATE `member` SET `mem_bollen`=0 WHERE `sid`=? ', [
        req.params.sid,
    ]);
});

// 激活會員
router.get('/true/:sid', (req, res) => {
    const sql = db.query('UPDATE `member` SET `mem_bollen`=1 WHERE `sid`=? ', [
        req.params.sid,
    ]);
});

module.exports = router;