const express = require('express');
const { exit } = require('process');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images')

// 定義 inArray function
function inArray(item, arr) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] == item) return true;
    }
    return false;
}
// add to cart api
// product to cart
router.post('/add-product-cart', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.body,
        code: 0,
        error: '',
    }
    const [data, fields] = await db.query(`SELECT product_id FROM cartProduct`);
    console.log(data);
    const arr = data.map(obj => obj.product_id)
    console.log(arr);
    if (inArray(req.body.sid, arr)) {
        output.code = 410;
        output.error = '商品已存在購物車';
        console.log(output);
        res.json(output)
    } else {
        const sql = "INSERT INTO `cartProduct`(`product_id`, `name`, `qty`, `price`, `member_id`) VALUES (?,?,?,?,?)";
        await db.execute(sql, [
            req.body.sid,
            req.body.name,
            req.body.qty,
            req.body.price,
            1450]); // 會員先寫死
        output.success = true;
        output.code = 200;
        output.error = '商品新增成功';
        console.log(output);
        res.json(output)
    }
})
// custom to cart
router.post('/add-custom-cart', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.body,
        code: 0,
        error: '',
    }
    const [data, fields] = await db.query(`SELECT custom_id FROM cartCustom`);
    console.log(data);
    const arr = data.map(obj => obj.custom_id)
    console.log(arr);
    if (inArray(req.body.sid, arr)) {
        output.code = 410;
        output.error = '商品已存在購物車';
        console.log(output);
        res.json(output)
    } else {
        const sql = "INSERT INTO `cartCustom`(`custom_id`, `name`, `qty`, `price`, `member_id`) VALUES (?,?,?,?,?)";
        await db.execute(sql, [
            req.body.sid,
            req.body.name,
            req.body.qty,
            req.body.price,
            1450]); // 會員先寫死
        output.success = true;
        output.code = 200;
        output.error = '商品新增成功';
        console.log(output);
        res.json(output)
    }
})
// lesson to cart
router.post('/add-lesson-cart', upload.none(), async (req, res) => {
    let output = {
        success: false,
        postData: req.body,
        code: 0,
        error: '',
    }
    const [data, fields] = await db.query(`SELECT lesson_id FROM cartLesson`);
    console.log(data);
    const arr = data.map(obj => obj.lesson_id)
    console.log(arr);
    console.log(inArray(req.body.sid, arr));
    if (inArray(req.body.sid, arr)) {
        output.code = 410;
        output.error = '商品已存在購物車';
        console.log(output);
        res.json(output)
    } else {
        const sql = "INSERT INTO `cartLesson`(`lesson_id`, `name`, `qty`, `price`, `member_id`) VALUES (?,?,?,?,?)";
        db.execute(sql, [
            req.body.sid,
            req.body.name,
            req.body.qty,
            req.body.price,
            1450]); // 會員先寫死
        output.success = true;
        output.code = 200;
        output.error = '商品新增成功';
        console.log(output);
        res.json(output)
    }
})

// delete api
// product delete
router.get('/delete-product-cart', upload.none(), (req, res) => {
    let output = {
        success: false,
        getData: req.query,
        code: 0,
        error: '',
        msg: '',
    }
    if (req.query) {
        const sql = `DELETE FROM cartProduct WHERE product_id IN (${req.query.sid})`;
        db.query(sql);
        output.success = true;
        output.code = 210;
        output.msg = '刪除成功'
        res.json(output)
    }
})
// custom delete
router.get('/delete-custom-cart', upload.none(), (req, res) => {
    let output = {
        success: false,
        getData: req.query,
        code: 0,
        error: '',
        msg: '',
    }
    if (req.query) {
        const sql = `DELETE FROM cartCustom WHERE custom_id IN (${req.query.sid})`;
        db.query(sql);
        output.success = true;
        output.code = 210;
        output.msg = '刪除成功'
        res.json(output)
    }
})
// lesson delete
router.get('/delete-lesson-cart', upload.none(), (req, res) => {
    let output = {
        success: false,
        getData: req.query,
        code: 0,
        error: '',
        msg: '',
    }
    if (req.query) {
        const sql = `DELETE FROM cartLesson WHERE lesson_id IN (${req.query.sid})`;
        db.query(sql);
        output.success = true;
        output.code = 210;
        output.msg = '刪除成功'
        res.json(output)
    }
})

// checkout to order



module.exports = router;