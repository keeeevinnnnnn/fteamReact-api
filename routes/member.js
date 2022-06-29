const express = require('express');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
require('dotenv').config();

router.post('/login', upload.none(), async (req, res) => {

    const output = {
        success: false,
        bollen: false,
        new: false,
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

    if (req.body.password !== row.mem_password) {
        output.error = '帳密錯誤';
        output.code = 402;
        return res.json(output);
    }

    if(row.mem_bollen==1){
        output.bollen = true;
    }else{
        output.error = '帳號已被停用';
        output.code = 403;
        return res.json(output);
    }

    const { sid, mem_account, mem_nickname, mem_created_at, mem_avatar } = row;

    const now = new Date();
    const newOld= now - mem_created_at;

    // 86400000是24小時的毫秒數
    if(newOld<86400000){
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
    // };

    // 進行加密讓前端頁面看不出來
    output.token = jwt.sign({ sid,
        mem_account,
        mem_nickname,
        new:output.new,
        mem_created_at,
        mem_avatar,
    }, process.env.JWT_KEY);

    res.json(output);
});

module.exports = router;
