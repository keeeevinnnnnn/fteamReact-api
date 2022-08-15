const express = require("express");
const router = express.Router();
const db = require("../modules/connect_db");
const upload = require("../modules/upload-images");
const moment = require("moment-timezone");

// -----------老師---------------
router.get("/teacher_category", async (req, res) => {
    // console.log(req.query);
    if (req.query.location === "忠孝館") {
        const sql =
            "SELECT * FROM `teacher_category` WHERE location = '忠孝館'";
        const [r] = await db.query(sql);
        res.json(r);
    }
    if (req.query.location === "板橋民生旗艦館") {
        const sql =
            "SELECT * FROM `teacher_category` WHERE location = '板橋民生旗艦館'";
        const [r] = await db.query(sql);
        res.json(r);
    }
    if (req.query.location === "台中精誠館") {
        const sql =
            "SELECT * FROM `teacher_category` WHERE location = '台中精誠館'";
        const [r] = await db.query(sql);
        res.json(r);
    }
});
// ------------------------------
router.get("/", upload.none(), async (req, res) => {
    // console.log(req.query.location);
    if (req.query.location === "忠孝館") {
        const sql = `SELECT lesson.*,dance_category.type,teacher_category.teacher_name,teacher_category.teacher_head,teacher_category.teacher_info FROM lesson JOIN teacher_category on teacher_category.sid = lesson.teacher_id JOIN dance_category ON dance_category.sid = lesson.dance_id WHERE lesson.location = '忠孝館'`;
        const [r] = await db.query(sql);
        // res.json(r);

        const begin = r.map((v, i) =>
            moment(v.duringtime_begin).format("YYYY-MM-DD")
        );
        const end = r.map((v, i) =>
            moment(v.duringtime_end).format("YYYY-MM-DD")
        );
        r.map((v, i) => (v.duringtime_begin = begin[i]));
        r.map((v, i) => (v.duringtime_end = end[i]));
        // console.log(end);
        res.json(r);
    }
    if (req.query.location === "板橋民生旗艦館") {
        // console.log(req.query.location);
        const sql =
            "SELECT lesson.*,dance_category.type,teacher_category.teacher_name FROM lesson JOIN teacher_category on teacher_category.sid = lesson.teacher_id JOIN dance_category ON dance_category.sid = lesson.dance_id WHERE lesson.location = '板橋民生旗艦館'";
        const [r] = await db.query(sql);
        const begin = r.map((v, i) =>
            moment(v.duringtime_begin).format("YYYY-MM-DD")
        );
        const end = r.map((v, i) =>
            moment(v.duringtime_end).format("YYYY-MM-DD")
        );
        r.map((v, i) => (v.duringtime_begin = begin[i]));
        r.map((v, i) => (v.duringtime_end = end[i]));
        res.json(r);
    }
    if (req.query.location === "台中精誠館") {
        // console.log(req.query.location);
        const sql =
            "SELECT lesson.*,dance_category.type,teacher_category.teacher_name FROM lesson JOIN teacher_category on teacher_category.sid = lesson.teacher_id JOIN dance_category ON dance_category.sid = lesson.dance_id WHERE lesson.location = '台中精誠館'";
        const [r] = await db.query(sql);
        const begin = r.map((v, i) =>
            moment(v.duringtime_begin).format("YYYY-MM-DD")
        );
        const end = r.map((v, i) =>
            moment(v.duringtime_end).format("YYYY-MM-DD")
        );

        r.map((v, i) => (v.duringtime_begin = begin[i]));
        r.map((v, i) => (v.duringtime_end = end[i]));
        res.json(r);
    }
});
module.exports = router;
