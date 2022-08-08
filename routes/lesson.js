const express = require("express");
const router = express.Router();
const db = require("../modules/connect_db");
const upload = require("../modules/upload-images");

// -----------測試---------------
router.get("/123", async (req, res) => {
  // console.log(req.query);
  const sql = "SELECT * FROM `lesson` WHERE 1";
  const [r] = await db.query(sql);
  res.json(r);
});
// ------------------------------
router.get("/", upload.none(), async (req, res) => {
  // console.log(req.query.location);
  if (req.query.location === "忠孝館") {
    const sql =
      "SELECT lesson.*,dance_category.type,teacher_category.teacher_name FROM lesson JOIN teacher_category on teacher_category.sid = lesson.teacher_id JOIN dance_category ON dance_category.sid = lesson.dance_id WHERE lesson.location = '忠孝館'";
    const [r] = await db.query(sql);
    res.json(r);
  }
  if (req.query.location === "板橋民生旗艦館") {
    // console.log(req.query.location);
    const sql =
      "SELECT lesson.*,dance_category.type,teacher_category.teacher_name FROM lesson JOIN teacher_category on teacher_category.sid = lesson.teacher_id JOIN dance_category ON dance_category.sid = lesson.dance_id WHERE lesson.location = '板橋民生旗艦館'";
    const [r] = await db.query(sql);
    res.json(r);
  }
  if (req.query.location === "台中精誠館") {
    // console.log(req.query.location);
    const sql =
      "SELECT lesson.*,dance_category.type,teacher_category.teacher_name FROM lesson JOIN teacher_category on teacher_category.sid = lesson.teacher_id JOIN dance_category ON dance_category.sid = lesson.dance_id WHERE lesson.location = '台中精誠館'";
    const [r] = await db.query(sql);
    res.json(r);
  }
});
module.exports = router;
