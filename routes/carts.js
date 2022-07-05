const express = require('express');
const { exit } = require('process');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images')

const fakeMember = 1493;

// 定義 inArray function
function inArray(item, arr) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] == item) return true;
    }
    return false;
}

// C need : item_type item_id quantity
router.post('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.body,
        code: 0,
        error: '',
    };
    const sql = "SELECT item_id FROM carts WHERE member_id=? AND item_type=?";
    const [data] = await db.query(sql, [fakeMember, req.body.type]);
    const arr = data.map(obj => obj.item_id)
    if (inArray(req.body.sid, arr)) {
        output.code = 410;
        output.error = '商品已存在購物車';
    } else {
        let r;
        if (req.body.type === "product") {
            const sql = "SELECT * FROM product WHERE sid=?";
            const [[data]] = await db.query(sql, [req.body.sid]);
            console.log(data);
            r = data;
        } else if (req.body.type === "custom") {
            const sql = "SELECT * FROM custom WHERE sid=?";
            const [[data]] = await db.query(sql, [req.body.sid]);
            console.log(data);
            r = data;
        } else if (req.body.type === "lesson") {
            const sql = "SELECT * FROM lesson WHERE sid=?";
            const [[data]] = await db.query(sql, [req.body.sid]);
            console.log(data);
            r = data;
        }
        const sql2 = "INSERT INTO `carts`(`item_id`, `item_type`, `quantity`, `item_price`, `member_id`) VALUES (?,?,?,?,?)";
        await db.execute(sql2, [
            req.body.sid,
            req.body.type,
            req.body.quantity,
            req.body.quantity * r.price,
            fakeMember]); // 會員先寫死
        output.success = true;
        output.code = 200;
        output.error = '商品新增成功';
    }
    res.json(output);
})

// R need : member_id item_type
router.get('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.query,
        code: 0,
        error: '',
    };
    let data;
    if (req.query.type) {
        const sql = "SELECT * FROM carts WHERE item_type=? AND member_id=? ORDER BY created_at";
        const [r] = await db.query(sql, [req.query.type, fakeMember]);
        console.log(r);
        data = r;
        output.success = true;
        output.code = 205;
    }
    res.json({ ...output, result: data });
})

// U  need :  member_id,item_type, item_id, quantity
router.put('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.query,
        code: 0,
        error: '',
        msg: '',
    };
    if (req.query) {
        const sql = "UPDATE `carts` SET `quantity`=? WHERE item_id=? AND item_type=? AND member_id=?";
        const [r] = await db.query(sql, [
            req.query.quantity,
            req.query.sid,
            req.query.type,
            fakeMember,
        ])
        if (r.affectedRows === 1) {
            output.success = true;
            output.code = 200;
            output.msg = '修改成功';
        }
    }
    res.json(output);
})

// D  need : item_type item_id
router.delete('/', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.query,
        code: 0,
        error: '',
        msg: '',
    };
    if (req.query) {
        const sql = "DELETE FROM carts WHERE item_id=? AND item_type=? AND member_id=?";
        const [r] = await db.query(sql, [req.query.sid, req.query.type, fakeMember])
        console.log(r);
        output.success = true;
        output.code = 200;
        output.msg = '刪除成功';
    }
    res.json(output);
})


module.exports = router;