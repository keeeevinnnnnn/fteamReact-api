const express = require("express");
const { exit } = require("process");
const db = require("../modules/connect_db");
const router = express.Router();
const upload = require("../modules/upload-images");
const fs = require("fs")
const { v4: uuidv4 } = require('uuid');

//第一張空單//
router.post("/", upload.none(),async (req, res) => {
  const member_id = req.body.member_id;
  const custom_product_name = req.body.custom_product_name;
  const wheel_style = req.body.wheel_style;
  const carrier = req.body.carrier;
  const front_color = req.body.front_color;
  const back_style = req.body.back_style;
  const back_pattern = req.body.back_pattern;
  const back_color = req.body.back_color;
  const back_text = req.body.back_text;
  const back_sticker = req.body.back_sticker;
  const back_img = req.body.back_img;
  const price = req.body.price;
  const created_date = req.body.created_date;
  const sql =
    "INSERT INTO `custom`( `member_id`, `custom_product_name`, `wheel_style`, `carrier`, `front_color`, `back_style`, `back_pattern`, `back_color`, `back_text`, `back_sticker`, `back_img`, `price`,`created_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,NOW())";
  const [r] =await db.query(sql, [
    req.body.member_id,
    req.body.custom_product_name,
    req.body.wheel_style,
    req.body.carrier,
    req.body.front_color,
    req.body.back_style,
    req.body.back_pattern,
    req.body.back_color,
    req.body.back_text,
    req.body.back_sticker,
    req.body.back_img,
    req.body.price,
    // req.body.created_date,
  ]);
  res.json(r);
});

//更新輪子//
router.post("/wheel", upload.none(),async (req, res) => {
  const sid = req.body.sid;
  const wheel_style = req.body.wheel_style;

  const sql = "UPDATE `custom` SET `wheel_style` = ? WHERE `custom`.`sid` = ?";

  const [r] = await db.query(sql, [req.body.wheel_style,req.body.sid]);
  res.json(r);
  
});

//更新輪架//
router.post("/carrier", upload.none(),async (req, res) => {
    const sid = req.body.sid;
    const carrier = req.body.carrier;
  
    const sql = "UPDATE `custom` SET `carrier` = ? WHERE `custom`.`sid` = ?";
  
    const [r] = await db.query(sql, [req.body.carrier,req.body.sid]);
    res.json(r);

  });

  //前板顏色//

  router.post("/frontcolor", upload.none(), async(req, res) => {
    const sid = req.body.sid;
    const front_color = req.body.front_color;
  
    const sql = "UPDATE `custom` SET `front_color` = ? WHERE `custom`.`sid` = ?";
  
    const [r] = await db.query(sql, [req.body.front_color,req.body.sid]);
    res.json(r);
  });

    //背板各種樣式//

    router.post("/back", upload.none(), async (req, res) => {
      const sid = req.body.sid;
      const back_style = req.body.back_style;
      const back_pattern = req.body.back_pattern;
      const back_color = req.body.back_color;
      const back_text = req.body.back_text;
      const back_sticker = req.body.back_sticker;

    
      const sql = "UPDATE `custom` SET `back_style`=?,`back_pattern`=?,`back_color`=?,`back_text`=?,`back_sticker`=? WHERE `custom`.`sid` = ?";
    
      const [r] = await db.query(sql, [req.body.back_style,req.body.back_pattern,req.body.back_color,req.body.back_text,req.body.back_sticker,req.body.sid]);
      res.json(r);
      
    });


    //存圖片//
    router.post('/upload', function(req, res){
      //接收base64
      var imgData = req.body.imgData;
      const cusimgName=uuidv4()
      //濾data:URL
      var base64Data = imgData.replace(/^data:image\/\w+;base64,/, "");
      var dataBuffer = new Buffer(base64Data, 'base64');

      const sid = req.body.sid;
      const back_img = 'cus'+cusimgName+'.png';
    
      const sql = "UPDATE `custom` SET `back_img` = ? WHERE `custom`.`sid` = ?";
    
      db.query(sql, [back_img,req.body.sid]);
      

      fs.writeFile(`./public/custom/${back_img}`, dataBuffer, function(err) {
          if(err){
            res.send(err);
          }else{
            res.send("saved");
          }
      });
  });

  //確認產品細節資料//
router.get("/confirm", upload.none(),async (req, res) => {
  const sid = req.body.sid;
 

  const sql = "SELECT `sid`, `member_id`, `custom_product_name`, `wheel_style`, `carrier`, `front_color`, `back_style`, `back_pattern`, `back_color`, `back_text`, `back_sticker`, `back_img`, `price`, `created_date` FROM `custom` WHERE sid = ?";
   const [r]=await db.query(sql, [req.query.sid]);
   console.log(r)  
    res.json(r) 
});

//分享牆//
router.get("/share", upload.none(),async (req, res) => {
 

  const sql = "SELECT custom.*, member.mem_name, member.mem_nickname, member.mem_avatar FROM `custom` JOIN `member` ON `custom`.`member_id`=`member`.`sid` ORDER BY `custom`.`sid` DESC";
   const [r] = await db.query(sql);
   console.log(r)  
    res.json(r) 
});

//只撈一筆//
router.get("/sharedetail", upload.none(),async (req, res) => {
  const sid = req.body.sid;

  const sql = "SELECT * FROM `custom` JOIN `member` ON `custom`.`member_id`=`member`.`sid` WHERE custom.sid=?";
  const [r]=await db.query(sql, [req.query.sid]);
  //  console.log(r)  
    res.json(r) 
});

//看自己的舊單//
router.get("/prevcusproduct", upload.none(),async (req, res) => {
  const sql = "SELECT custom.*,member.mem_name,member.mem_avatar FROM custom JOIN member ON member.sid = custom.member_id WHERE custom.member_id = ?";
  const [r] = await db.query(sql,[req.query.member_id])
  res.json(r);
});


//留言//
router.post("/comment", upload.none(),async (req, res) => {
  const id = req.body.id;
  const mes_cusproduct_id = req.body.mes_cusproduct_id;
  const mes_member_id = req.body.mes_member_id;
  const stars = req.body.stars;
  const comment = req.body.comment;

  const sql = "INSERT INTO `cus_message`( `mes_cusproduct_id`, `mes_member_id`, `stars`, `comment`, `created_time`) VALUES (?,?,?,?,NOW())";

  const [r] = await db.query(sql, [req.body.mes_cusproduct_id,req.body.mes_member_id,req.body.stars,req.body.comment]);
  res.json(r);
  
});

//讀取留言//
router.get("/messageboard", upload.none(),async (req, res) => {
  // const sid = req.body.sid;
  const mes_cusproduct_id = req.body.mes_cusproduct_id

  const sql = "SELECT * FROM custom JOIN cus_message ON custom.sid = cus_message.mes_cusproduct_id JOIN member ON cus_message.mes_member_id = member.sid WHERE custom.sid=? ;";
  const [r]=await db.query(sql, [req.query.mes_cusproduct_id]);
   console.log(r)  
    res.json(r) 
});








module.exports = router;
