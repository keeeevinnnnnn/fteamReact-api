const express = require('express');
const { exit } = require('process');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images');
const Joi = require('joi');
const { text } = require('stream/consumers');
// const fakeMember = 1493;

//後端檢查用
// const schema = Joi.object({
//     //字串類型
//     memID: Joi.number().required(),
//     recipient: Joi.string().min(2).required(),
//     address: Joi.string().required(),
//     shipping: Joi.string().required(),
// });

// checkout to orders
// need member_id carts's sid
router.post('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.body,
        code: 0,
        error: '',
        msg: '',
        orderNumber: '',
    };
    // const test = schema.validate(req.body, { abortEarly: false });

    // if (test.error) {
    //     console.log(test.error);
    // }
    // 取得此會員購物車內的商品
    const sql = `SELECT * FROM carts WHERE member_id = ${req.body.memID}`;
    const [r] = await db.query(sql);
    console.log('r: ', r);

    // 計算訂單總額
    let total = 0;
    for (let i of r) {
        total += i.item_price
    }
    if (total === 0) {
        output.code = 420;
        output.error = '訂單金額不得為零'
        res.json(output);
    }
    // 寫入訂單
    const sql1 = "INSERT INTO `orders`(`member_sid`, `recipient`, `address`, `shipping_method`, `total`) VALUES (?,?,?,?,?)"
    const [r1] = await db.query(sql1, [req.body.memID, req.body.recipient, req.body.address, req.body.shipping, total]);
    console.log(r1);
    // if 訂單新增成功 1.寫入訂單明細 2.刪除已結帳完畢的商品
    if (r1.affectedRows === 1) {
        for (let i of r) {
            // console.log(i);
            if (i.item_type === 'lesson') {
                let [[lessonData]] = await db.query(`SELECT quota FROM lesson WHERE sid = ${i.item_id}`)
                db.query(`UPDATE lesson SET quota=${lessonData.quota - 1} WHERE sid =${i.item_id}`)
            }
            const sql2 = "INSERT INTO `order_details`(`order_id`, `member_id`, `item_id`, `item_type`,`quantity`, `price`) VALUES (?,?,?,?,?,?)"
            const [r2] = await db.query(sql2, [
                r1.insertId,
                req.body.memID,
                i.item_id,
                i.item_type,
                i.quantity,
                i.item_price
            ])
        }
        const sql3 = `DELETE FROM carts WHERE  member_id = ${req.body.memID}`;
        const [r3] = await db.query(sql3)
        output.success = 'success';
        output.code = 210;
        output.msg = '訂單新增成功'
        output.orderNumber = r1.insertId;
    }
    res.json(output);
})
// R : 讀取此會員 所有訂單 新到舊
router.get('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        paramsData: req.query,
        code: 0,
        error: '',
        msg: '',
    };
    if (req.query) {
        const sql = "SELECT * FROM orders WHERE member_sid = ? ORDER BY order_date DESC"
        const [r] = await db.query(sql, [req.query.memID]);
        if (r.length !== 0) {
            output.success = true;
            output.code = 200;
            output.msg = '讀取成功';
            output.result = r;
            res.json(output)
        } else {
            output.success = false;
            output.code = 400;
            output.msg = '沒有購買紀錄';
            res.json(output)
        }
    }
})
// R : 搜尋訂單
router.get('/search', upload.none(), async (req, res) => {
    let output = {
        success: false,
        paramsData: req.query,
        code: 0,
        error: '',
        msg: '',
    };
    if (req.query) {
        const sql = "SELECT * FROM orders WHERE member_sid = ? AND sid LIKE '%?%' ORDER BY order_date DESC"
        const [r] = await db.query(sql, [req.query.memID, +req.query.search]);
        if (r.length !== 0) {
            output.success = true;
            output.code = 200;
            output.msg = '讀取成功';
            output.result = r;
            res.json(output)
        } else {
            output.success = false;
            output.code = 400;
            output.msg = '沒有購買紀錄';
            res.json(output)
        }
    }
})
// 查看此訂單明細
router.get('/detail', upload.none(), async (req, res) => {
    let output = {
        success: false,
        paramsData: req.query,
        code: 0,
        error: '',
        msg: '',
    };
    if (req.query) {
        const sql = 'SELECT * FROM order_details WHERE order_id=?';
        const [r] = await db.query(sql, [req.query.orderID]);
        if (r.length !== 0) {
            res.json(r);
        } else {
            res.send('沒有資料')
        }
    }
})
module.exports = router;