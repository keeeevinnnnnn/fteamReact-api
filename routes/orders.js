const express = require('express');
const { exit } = require('process');
const db = require('../modules/connect_db');
const router = express.Router();
const upload = require('../modules/upload-images')

const fakeMember = 1493;

// 定義 inArray function
function inArray(item, arr) {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] == item) return true;
    }
    return false;
}

// checkout to orders
router.post('/', upload.none(), async (req, res) => {

})


// checkout to order_details

module.exports = router;