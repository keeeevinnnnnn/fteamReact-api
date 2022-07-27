const express = require("express");
const db = require("../modules/connect_db");
const router = express.Router();

// 全部商品
router.post("/", async (req, res) => {
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
  let page = +req.body.filter.page || 1;
  let where = " WHERE 1=1 ";
  let orderfield = "sid";
  let sort = "ASC";

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
    // 預設 ORDER BY SID，如果要查詢更動 ORDER BY SID
    switch (req.body.filter.orderfield) {
      case "categoryId":
        orderfield = "category_id";
        break;
      case "brand":
        orderfield = "brand";
        break;
      case "name":
        orderfield = "name";
        break;
      case "price":
        orderfield = "price";
        break;
      default:
        orderfield = "sid";
        break;
    }

    // 預設 WHERE = 1=1，如果查詢更動 WHERE
    switch (req.body.filter.where) {
      case "categoryId":
        where = " WHERE categoryId ";
        break;
      case "brand":
        where = " WHERE brand ";
        break;
      case "name":
        where = " WHERE name ";
        break;
      case "price":
        where = " WHERE price ";
        break;
      default:
        where = " WHERE 1=1 ";
        break;
    }

    let sql02 = `SELECT * FROM product ${where}`;

    // 預設都是null，如果不等於null，我才要執行前端送來的參數，不然都是null執行全部
    if (req.body.filter.categoryId != 0) {
      let categoryId = req.body.filter.categoryId;
      sql02 = sql02 + " and category_id = " + categoryId;
    }

    if (req.body.filter.brand != "") {
      let brand = req.body.filter.brand;
      sql02 = sql02 + " and brand = " + `"${brand}"`;
    }

    if (req.body.filter.color != "") {
      let color = req.body.filter.color;
      sql02 = sql02 + " and color = " + `"${color}"`;
    }

    if (req.body.filter.price != 0) {
      let price = req.body.filter.price;
      sql02 = sql02 + " and prcie = " + price;
    }

    if (req.body.filter.sort != "") {
      sort = req.body.filter.sort;
    }

    if (req.body.filter.priceRange.length > 0) {
      let priceRange = req.body.filter.priceRange;
      sql02 = sql02 + " BETWEEN " + priceRange[0] + " AND " + priceRange[1];
    }

    console.log("req.body.filter===", req.body.filter);

    console.log("sql02==", sql02);

    let sql04 = ` ORDER BY ${orderfield} ${sort} LIMIT ${
      (page - 1) * output.perPage
    }, ${output.perPage}`;

    let [r2] = await db.query(sql02 + sql04);
    output.rows = r2;

    console.log("compSQL==", sql02 + sql04);
  }
  output.code = 200;
  output = { ...output, page, totalRows, totalPages };
  res.json(output);
});

module.exports = router;
