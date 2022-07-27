const express = require('express');
const { exit } = require('process');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images')


router.post('/',upload.none(),(req,res)=>{
    const member_id = req.body.member_id;
    const custom_product_name= req.body.custom_product_name;
    const wheel_style = req.body.wheel_style;
    const carrier = req.body.carrier;
    const front_color = req.body.front_color;
    const back_style = req.body.back_style;
    const back_text = req.body.back_text;
    const back_sticker = req.body.back_sticker;
    const back_filter = req.body.back_filter;
    const back_img = req.body.back_img;
    const price = req.body.price;
    const created_date = req.body.created_date;
    const sql = 'INSERT INTO `custom`( `member_id`, `custom_product_name`, `wheel_style`, `carrier`, `front_color`, `back_style`, `back_text`, `back_sticker`, `back_filter`, `back_img`, `price`, `created_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)';
    db.query(sql,[
        req.body.member_id,
        req.body.custom_product_name,
        req.body.wheel_style,
        req.body.carrier,
        req.body.front_color,
        req.body.back_style,
        req.body.back_text,
        req.body.back_sticker,
        req.body.back_filter,
        req.body.back_img,
        req.body.price,
        req.body.created_date,
        
    ])
    
})
module.exports =router;