const express = require('express');
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
// product add to cart
router.post('/to-product-cart', upload.none(), async (req, res) => {
    const [data, fields] = await db.query(`SELECT product_id FROM cartProduct`);
    console.log(data);
    const arr = data.map(obj => obj.product_id)
    console.log(arr);
    if (inArray(req.body.sid, arr)) {
        console.log('商品已存在購物車');
    } else {
        const sql = "INSERT INTO `cartProduct`(`product_id`, `name`, `qty`, `price`, `member_id`) VALUES (?,?,?,?,?)";
        await db.execute(sql, [
            req.body.sid,
            req.body.name,
            req.body.qty,
            req.body.price,
            1450]); // 會員先寫死
        console.log('商品新增成功');
    }
    res.json(req.body)
})

// custom add to cart
router.post('/to-custom-cart', upload.none(), async (req, res) => {
    const [data, fields] = await db.query(`SELECT custom_id FROM cartCustom`);
    console.log(data);
    const arr = data.map(obj => obj.custom_id)
    console.log(arr);
    if (inArray(req.body.sid, arr)) {
        console.log('商品已存在購物車');
    } else {
        const sql = "INSERT INTO `cartCustom`(`custom_id`, `name`, `qty`, `price`, `member_id`) VALUES (?,?,?,?,?)";
        await db.execute(sql, [
            req.body.sid,
            req.body.name,
            req.body.qty,
            req.body.price,
            1450]); // 會員先寫死
            console.log('商品新增成功');
    }
    res.json(req.body)
})

// lesson add to cart
router.post('/to-lesson-cart', upload.none(), async (req, res) => {
    const [data, fields] = await db.query(`SELECT lesson_id FROM cartLesson`);
    console.log(data);
    const arr = data.map(obj => obj.lesson_id)
    console.log(arr);
    console.log(inArray(req.body.sid, arr));
    if (inArray(req.body.sid, arr)) {
        console.log('商品已存在購物車');
    } else {
        const sql = "INSERT INTO `cartLesson`(`lesson_id`, `name`, `qty`, `price`, `member_id`) VALUES (?,?,?,?,?)";
        await db.execute(sql, [
            req.body.sid,
            req.body.name,
            req.body.qty,
            req.body.price,
            1450]); // 會員先寫死
            console.log('商品新增成功');
    }
    res.json(req.body)
})

module.exports = router;