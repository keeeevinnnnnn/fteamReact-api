const express = require('express');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images');
const Joi = require('joi');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
require('dotenv').config();

// 停用會員
router.get('/false', (req, res) => {
    const sql = db.query('UPDATE `member` SET `mem_bollen`=0 WHERE `sid`=? ', [
        req.query.sid,
    ]);
});

// 激活會員
router.get('/true', (req, res) => {
    const sql = db.query('UPDATE `member` SET `mem_bollen`=1 WHERE `sid`=? ', [
        req.query.sid,
    ]);
});

module.exports = router;