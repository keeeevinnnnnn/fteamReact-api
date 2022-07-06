const express = require('express');
const { exit } = require('process');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images');

const fakeMember = 1493;

// 定義 inArray function
function inArray(item, arr) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] == item) return true;
    }
    return false;
}

// checkout to orders
// need member_id carts's sid
router.post('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.body,
        code: 0,
        error: '',
        msg: '',
        orderNunber: '',
    };
    console.log(req.body.sid);
    // 如果使用者指勾選一樣商品做結帳 先包成陣列
    let reqSid;
    if (Array.isArray(req.body.sid)) {
        reqSid = req.body.sid;
    } else {
        reqSid = [req.body.sid]
    }
    // console.log(typeof reqSid[0]); // 如果沒有勾選送過來為 [undefined] 的陣列

    let sid_arr = [];
    // 如果req.body.sid 有值 且 !== undefined 再執行結帳動作
    if (reqSid.length && reqSid[0] !== undefined) {
        // 將傳進來的陣列 sid 轉換 number
        sid_arr = reqSid.map(el => parseInt(el));

        // 取得此會員購物車內的商品
        const sql = `SELECT * FROM carts WHERE sid IN (?) AND member_id = ?`;
        const [r] = await db.query(sql, [sid_arr, fakeMember]);
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
        const sql1 = "INSERT INTO `orders`(`member_sid`, `total`) VALUES (?,?)"
        const [r1] = await db.query(sql1, [fakeMember, total]);
        console.log(r1);
        // if 訂單新增成功 1.寫入訂單明細 2.刪除已結帳完畢的商品
        if (r1.affectedRows === 1) {
            for (let i of r) {
                console.log(i);
                const sql2 = "INSERT INTO `order_details`(`order_id`, `member_id`, `item_id`, `item_type`,`quantity`, `price`) VALUES (?,?,?,?,?,?)"
                const [r2] = await db.query(sql2, [
                    r1.insertId,
                    fakeMember,
                    i.item_id,
                    i.item_type,
                    i.quantity,
                    i.item_price
                ])
            }
            const sql3 = "DELETE FROM carts WHERE sid IN (?) AND member_id = ?";
            const [r3] = await db.query(sql3, [sid_arr, fakeMember])
            output.code = 210;
            output.msg = '訂單新增成功'
            output.orderNunber = r1.insertId;

        }
        res.json(output);
    } else {
        output.code = 420;
        output.error = '沒有勾選商品'
        res.json(output)
    }
})

module.exports = router;