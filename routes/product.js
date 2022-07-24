const express = require("express");
const db = require("../modules/connect_db");
const router = express.Router();

// 全部商品
router.get("/", async (req, res) => {
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
  let where = " WHERE 1=1 ";

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

// ToolBox Skateboard filter
router.get("/skateboard", async (req, res) => {
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
  let where = " WHERE 1=1 ";

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

    const sql02 = `SELECT * FROM product ${where} AND category_id IN(2,3) ORDER BY sid LIMIT ${
      (page - 1) * output.perPage
    }, ${output.perPage}`;
    const [r2] = await db.query(sql02);
    output.rows = r2;
  }
  output.code = 200;
  output = { ...output, page, totalRows, totalPages };

  res.json(output);
});

// ToolBox Decks filter
router.get("/decks", async (req, res) => {
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
  let where = " WHERE 1=1 ";

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

    const sql02 = `SELECT * FROM product ${where} AND category_id=4 ORDER BY sid LIMIT ${
      (page - 1) * output.perPage
    }, ${output.perPage}`;
    const [r2] = await db.query(sql02);
    output.rows = r2;
  }
  output.code = 200;
  output = { ...output, page, totalRows, totalPages };

  res.json(output);
});

// ToolBox Trucks filter
router.get("/trucks", async (req, res) => {
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
  let where = " WHERE 1=1 ";

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

    const sql02 = `SELECT * FROM product ${where} AND category_id=5 ORDER BY sid LIMIT ${
      (page - 1) * output.perPage
    }, ${output.perPage}`;
    const [r2] = await db.query(sql02);
    output.rows = r2;
  }
  output.code = 200;
  output = { ...output, page, totalRows, totalPages };

  res.json(output);
});

// ToolBox Wheels filter
router.get("/wheels", async (req, res) => {
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
  let where = " WHERE 1=1 ";

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

    const sql02 = `SELECT * FROM product ${where} AND category_id=6 ORDER BY sid LIMIT ${
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
