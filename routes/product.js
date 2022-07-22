const express = require("express");
const db = require("../modules/connect_db");
const router = express.Router();

router.get("/product", async (req, res) => {
  let output = {
    perPage: 15,
    page: 1,
    totalRows: 0,
    totalPages: 0,
    code: 0, // 辨識狀態
    error: "",
    query: {},
    rows: [],
  };
  let page = +req.query.page || 1;
  let search = req.query.search || "";
  let where = " WHERE 1 ";
  if (search) {
    where += ` AND name LIKE ${db.escape("%" + search + "%")} `;
    output.query.search = search;
  }

  if (page < 1) {
    output.code = 410;
    output.error = "頁碼太小";
    return output;
  }

  const sql01 = `SELECT COUNT(1) totalRows FROM product ${where} `;
  const [[{ totalRows }]] = await db.query(sql01);
  let totalPages = 0;
  if (totalRows) {
    totalPages = Math.ceil(totalRows / output.perPage);
    if (page > totalPages) {
      output.totalPages = totalPages;
      output.code = 420;
      output.error = "頁碼太大";
      return output;
    }

    const sql02 = `SELECT * FROM product ${where} ORDER BY sid LIMIT ${
      (page - 1) * output.perPage
    }, ${output.perPage}`;
    const [r2] = await db.query(sql02);
    output.rows = r2;
  }
  output.code = 200;
  output = { ...output, page, totalRows, totalPages };

  res.json(output);
});

module.exports = router;
