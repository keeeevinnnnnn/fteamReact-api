const express = require("express");
const db = require("../modules/connect_db");
const router = express.Router();

router.post('/',(req,res)=>{
    const member_id = req.body.member_id;
    const custom_product_name= req.body.custom_product_name;
    const wheel_style = req.body.wheel_style;
    const carrier = req.body.carrier;
    const front_color = req.body.front_color;
    const back_style = req.body.back_style;
    const back_text = req.body.back_text;
    const back_filter = req.body.back_filter;
    const back_img = req.body.back_img;
    const price = req.body.price;
    const created_date = req.body.created_date;

    db.query('INSERT INTO `custom`( `member_id`, `custom_product_name`, `wheel_style`, `carrier`, `front_color`, `back_style`, `back_text`, `back_sticker`, `back_filter`, `back_img`, `price`, `created_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)',
    (err,result)=>{
        if(err){
            console.log(err);
        } else{
            res.send("Value Inserted")
        }
    }
    
    )
})