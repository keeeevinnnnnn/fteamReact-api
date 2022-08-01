const { log } = require("console");
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
  let orderField = "sid";
  let sort = "asc";

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

    sort != null ? req.query.sort : sort;

    if (orderField != null) {
      orderField = req.query.orderField;
    }

    // 預設 ORDER BY SID
    switch (orderField) {
      case "categoryId":
        orderField = "category_id";
        break;
      case "brand":
        orderField = "brand";
        break;
      case "color":
        orderField = "color";
        break;
      default:
        orderField = "sid";
        break;
    }

    let sql02 = `SELECT * FROM product ${where}`;

    // 預設都是null，如果不等於null，我才要執行前端送來的參數，不然都是null執行全部
    if (req.query.categoryId != null) {
      let categoryId = req.query.categoryId;
      sql02 = sql02 + " and category_id = " + categoryId;
    }

    if (req.query.brand != null) {
      let brand = req.query.brand;
      sql02 = sql02 + " and brand = " + `"${brand}"`;
    }

    if (req.query.color != null) {
      let color = req.query.color;
      sql02 = sql02 + " and color = " + `"${color}"`;
    }

    if (req.query.price != null) {
      let price = req.query.price;
      sql02 = sql02 + " and prcie = " + price;
    }

    // console.log(sql02);
    // console.log(req.body.filter);

    const sql04 = ` ORDER BY ${orderField} ${sort} LIMIT ${
      (page - 1) * output.perPage
    }, ${output.perPage}`;

    const [r2] = await db.query(sql02 + sql04);
    output.rows = r2;
  }
  output.code = 200;
  output = { ...output, page, totalRows, totalPages };
  res.json(output);
});

router.get("/:productId", async (req, res) => {
  if (req.params.productId != null) {
    let sql =
      "SELECT * FROM `product` WHERE 1=1 and sid = " + req.params.productId;
    const [product] = await db.query(sql);

    if (product.length > 0) {
      res.json(product[0]);
    }
  }
});

module.exports = router;
